class StudentSchoolsController < ApplicationController
  before_action :find_student_school, only: %i[star unstar]

  def sort
    key = params.keys.first
    student = Student.find(key)
    return unless student.present?

    params[key].flatten.each_with_index do |bps_id, i|
      student_school = student.student_schools.where(bps_id: bps_id).first
      student_school.update(sort_order_position: i, ranked: true) if student_school.present?
    end
  end

  def star
    respond_to do |format|
      if @student_school.present? && @student_school.update_column(:starred, true)
        format.js { render template: "student_schools/actions/star" }
      end
    end
  end

  def unstar
    respond_to do |format|
      if @student_school.present? && @student_school.update_column(:starred, false)
        format.js { render template: "student_schools/actions/unstar" }
      end
    end
  end

  def add_another
    @current_school = StudentSchool.find(params[:id])
    @current_student = current_student

    respond_to do |format|
      if @current_school.present? && @current_school.update(sort_order_position: 1, ranked: true)
        @last_school = current_student.home_schools.rank(:sort_order)[5] # ensures schools are ranked first
        format.js { render template: "student_schools/actions/add_another" }
      end
    end
  end

  private

  # Find the student_school for star/unstar/add_another actions
  def find_student_school
    @student_school = StudentSchool.find(params[:id])
  end

  # Strong parameters for update and create actions
  def student_school_params
    params.require(:student_school).permit(
      :distance, :drive_time, :school_id, :student_id, :tier, :eligibility, :transportation_eligibility,
      :walk_time, :walk_zone_eligibility, :sort_order_position, :bps_id, :ranked, :exam_school, :school_type, :starred,
      :ell_cluster, :ell_description, :sped_cluster, :sped_description, :call_id, :choice_rank,
      :school_name, :program_code, :program_code_description, :special_admissions, :walk_distance, :dese_tier, :sort_order,
      :tier_explanation, :school_dese_accountability
    )
  end
end
