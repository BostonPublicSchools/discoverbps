# frozen_string_literal: true

# This is responsible for managing Students
class Student < ApplicationRecord
  acts_as_paranoid

  belongs_to :user
  has_and_belongs_to_many :preferences, -> { distinct }, after_add: :count_preferences, after_remove: :count_preferences
  has_many :student_schools, -> { distinct }
  has_many :schools, through: :student_schools
  has_many :choice_schools, -> { where('school_type = ?', 'choice') }, class_name: 'StudentSchool'
  has_many :home_schools, -> { where('school_type = ?', 'home') }, class_name: 'StudentSchool'
  has_many :ell_schools, -> { where('school_type = ?', 'ell') }, class_name: 'StudentSchool'
  has_many :sped_schools, -> { where('school_type = ?', 'sped') }, class_name: 'StudentSchool'
  has_many :starred_schools, -> { where('starred = ?', true) }, class_name: 'StudentSchool'

  scope :verified, -> { where(address_verified: true) }
  # TODO: remove since rails 5 no longer support, but kept for testing
  # attr_accessible   :first_name, :last_name, :grade_level, :primary_language, :session_id, :sibling_school_ids,
  #                   :sibling_school_names, :street_name, :street_number, :neighborhood, :zipcode, :latitude, :longitude,
  #                   :addressid, :user_id, :preference_ids, :school_ids, :sped_needs, :ell_language, :awc_invitation,
  #                   :schools_last_updated_at, :x_coordinate, :y_coordinate, :address_verified, :geo_code, :preferences_count,
  #                   :home_schools_json, :ell_schools_json, :sped_schools_json, :favorite, :step,
  #                   :ell_cluster, :sped_cluster, :zone, :token, :session_token, :student_id, :address_id, :ranked, :ranked_at,
  #                   :parent_name, :choice_schools_json

  serialize :sibling_school_names
  serialize :sibling_school_ids
  serialize :home_schools_json
  serialize :ell_schools_json
  serialize :sped_schools_json
  serialize :choice_schools_json

  # validates :street_number, :street_name, :zipcode, :grade_level, presence: true
  # validates :street_number, length: { maximum: 5 }
  validates :grade_level, inclusion: { in: %w[K0 K1 K2 1 2 3 4 5 6 7 8 9 10 11 12],
                                       message: '%<value>s is not valid' }

  before_validation :format_grade_level
  before_save :strip_first_name, :strip_last_name, :strip_street_number, :strip_street_name, :strip_zipcode

  def self.save_choice_student_and_schools(token, session_token, session_id, caseid)
    response = Webservice.get_student_homebased_choices(caseid, SCHOOL_YEAR_CONTEXT, SERVICE_CLIENT_CODE, token)

    studentInfo = Webservice.get_student(token, caseid)
    student = Student.where(token: token).first_or_initialize
    old_case_error_response = response.is_a?(Hash) && response[:Message]
    if old_case_error_response
      old_case_id = student.student_caseid

      Rails.logger.info "Error: #{old_case_error_response}"
      Rails.logger.info "Old URL: https://discover-bps-staging.herokuapp.com/choice_schools?token=#{token}&caseid=#{old_case_id}"
      false
    elsif response.present?
      if student.save_from_api_response(session_id, session_token, studentInfo, caseid)
        if student.set_choice_schools(response)
          student
        else
          false
        end
      else
        false
      end
    else
      false
    end
  end

  def tab_name
    if first_name.present?
      first_name
    elsif grade_level.present?
      "Grade #{grade_level}"
    else
      'Anonymous'
    end
  end

  def full_name
    "#{first_name.try(:humanize)} #{last_name.try(:humanize)}"
  end

  def full_address
    "#{street_number} #{street_name.try(:titleize)}, #{neighborhood} MA #{zipcode}"
  end

  def created_at_date
    created_at.to_date
  end

  def formatted_grade_level
    grade_level.to_s.length < 2 ? "0#{grade_level.try(:strip)}" : grade_level.try(:strip)
  end

  def formatted_grade_level_name
    if grade_level.to_s.length < 2
      "Grade #{grade_level}"
    else
      grade_level
    end
  end

  def set_choice_schools(schools_array)
    save_student_schools(schools_array, 'choice')
  end

  def set_home_schools(is_awc)
    api_schools = Webservice.get_home_schools(formatted_grade_level, addressid, sibling_school_ids,
                                              SERVICE_CLIENT_CODE, is_awc)
    save_student_schools(api_schools, 'home')
  end

  def set_ell_schools
    api_schools = Webservice.get_ell_schools(formatted_grade_level, addressid, ell_language,
                                             SERVICE_CLIENT_CODE)
    save_student_schools(api_schools, 'ell')
  end

  def set_sped_schools
    api_schools = Webservice.get_sped_schools(formatted_grade_level, addressid)
    save_student_schools(api_schools, 'sped')
  end

  def save_from_api_response(session_id, session_token, student_hash, caseid)
    self.session_id = session_id
    self.session_token = session_token
    self.student_id = student_hash[:StudentID].try(:strip)
    self.first_name = student_hash[:FirstName].try(:strip)
    self.last_name = student_hash[:LastName].try(:strip)
    self.grade_level = student_hash[:Grade].try(:strip).try(:gsub, /^0/, '')
    self.address_id = student_hash[:AddressID]
    self.street_number = student_hash[:Streetno].try(:strip)
    self.street_name = student_hash[:Street].try(:strip).try(:titleize)
    self.neighborhood = student_hash[:City].try(:strip).try(:titleize)
    self.zipcode = student_hash[:ZipCode].try(:strip)
    self.x_coordinate = student_hash[:X]
    self.y_coordinate = student_hash[:Y]
    self.latitude = student_hash[:Latitude]
    self.longitude = student_hash[:Longitude]
    self.addressid = student_hash[:AddressID].try(:to_s).try(:strip)
    self.geo_code = student_hash[:GeoCode]
    self.address_verified = true
    self.awc_invitation = student_hash[:IsAWCEligible]
    self.ranked = student_hash[:HasRankedChoiceSubmitted]
    self.ranked_at = student_hash[:RankedChoiceSubmittedDate]
    self.student_caseid = caseid
    save!
  end

  private

  # this method pulls a list of eligible schools from the GetSchoolChoices API,
  # saves the schools to student_schools, and fetches distance and walk/drive times from the Google Matrix API
  def save_student_schools(api_schools, school_list_type)
    # loop through the schools returned from the API, find the matching schools in the db,
    # save the eligibility variables on student_schools, and collect the coordinates for the matrix search, below
    return false unless api_schools.present?

    send("#{school_list_type}_schools".to_sym).clear
    begin
      update_column("#{school_list_type}_schools_json".to_sym, api_schools.to_json)
    rescue StandardError
      nil
    end

    # create the student schools

    school_coordinates = ''
    school_ids = []
    program_codes = []
    mid_codes = []
    school_names = []

    if school_list_type == 'choice'
      Rails.logger.info '****sorting**'
      api_schools.sort_by { |c| c[:SortOrder] }
    end
    api_schools.each do |api_school|
      # schoolId = (school_list_type == "choice" || school_list_type == "home") ? api_school[:SchoolLocalId] : api_school[:SchoolID]
      schoolId = if %w[choice home].include?(school_list_type)
                   api_school[:SchoolLocalId]
                 elsif school_list_type == 'ell'
                   api_school[:SchoolId]
                 else
                   api_school[:SchoolID]
                 end
      school = School.where(bps_id: schoolId).first
      if %w[home ell].include?(school_list_type)
        if school.present? && !school_ids.include?(school.id)
          schools_with_school_list_type school, api_school, school_list_type, school_ids, school_coordinates
        end
      elsif school_list_type == 'sped'
        if school.present? && (!school_ids.include?(school.id) || api_schools.map do |mid_code|
          true unless mid_codes.include?(mid_code[:MidCode])
        end)
          mid_codes.push(api_school[:MidCode])
          schools_with_school_list_type school, api_school, school_list_type, school_ids, school_coordinates
        end
      elsif school_list_type == 'choice'
        if school.present? && (!school_ids.include?(school.id) || api_schools.map do |x|
          true if program_codes.include?(x[:ProgramId]) && school_names.include?(x[:SchoolName])
        end.include?(true))
          school_names.push(api_school[:SchoolName])
          program_codes.push(api_school[:ProgramId])
          schools_with_school_list_type school, api_school, school_list_type, school_ids, school_coordinates
        end
      end
    end

    # save distance, walk time and drive time on student_schools
    if longitude.present? && latitude.present?
      school_coordinates = school_coordinates.dup
      school_coordinates.gsub!(/\|$/, '')

      walk_matrix = Google.walk_times(latitude, longitude, school_coordinates)
      drive_matrix = Google.drive_times(latitude, longitude, school_coordinates)

      api_schools.each_with_index do |api_school, i|
        # schoolId = (school_list_type == "choice" || school_list_type == "home") ? api_school[:SchoolLocalId] : api_school[:SchoolID]
        schoolId = if %w[choice home].include?(school_list_type)
                     api_school[:SchoolLocalId]
                   elsif school_list_type == 'ell'
                     api_school[:SchoolId]
                   else
                     api_school[:SchoolID]
                   end
        school = School.where(bps_id: schoolId).first
        if %w[choice home].include?(school_list_type) && school.present?
          school.update_attributes(latitude: api_school[:Latitude], longitude: api_school[:Longitude])
        end
        next unless school.present?

        walk_time = walk_matrix.try(:[], i).try(:[], :duration).try(:[], :text)
        drive_time = drive_matrix.try(:[], i).try(:[], :duration).try(:[], :text)

        student_school = student_schools.where(school_id: school.id).first_or_initialize
        student_school.walk_time = walk_time
        student_school.drive_time = drive_time
        student_school.save
      end

      update_column(:schools_last_updated_at, Time.now)
    end

    true
  end

  def schools_with_school_list_type(school, api_school, school_list_type, school_ids, _school_coordinates)
    school_ids << school.id
    StudentSchool.create_from_api_response(self, school, api_school, school_list_type)
  end

  def strip_first_name
    self.first_name = first_name.try(:strip)
  end

  def strip_last_name
    self.last_name = last_name.try(:strip)
  end

  def format_grade_level
    self.grade_level = grade_level.try(:strip).try(:upcase)
  end

  def strip_street_number
    self.street_number = street_number.try(:strip).try(:gsub, /\D/, '')
  end

  def strip_street_name
    self.street_name = street_name.try(:strip)
  end

  def strip_zipcode
    self.zipcode = zipcode.try(:strip)
  end

  def count_preferences(_preference)
    update_column(:preferences_count, preferences.count)
  end
end
