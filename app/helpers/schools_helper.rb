require 'uri'
require 'base64'
module SchoolsHelper
	ENGLISH = 'adb1bf7f-dcaf-41d1-bcb6-f8a25867a65b'.freeze

	def facilities_list_helper(school)
		facilities = school.api_facilities
		if facilities.present?
			array = []
			array << 'Art Room' 							if facilities[:hasartroom] == 'True'
			array << 'Athletic Field' 				if facilities[:hasathleticfield] == 'True'
			array << 'Auditorium' 						if facilities[:hasauditorium] == 'True'
			array << 'Cafeteria' 							if facilities[:hascafeteria] == 'True'
			array << 'Computer Lab' 					if facilities[:hascomputerlab] == 'True'
			array << 'Gymnasium' 							if facilities[:hasgymnasium] == 'True'
			array << 'Library' 								if facilities[:haslibrary] == 'True'
			array << 'Music Room' 						if facilities[:hasmusicroom] == 'True'
			array << 'Outdoor Classrooms' 		if facilities[:hasoutdoorclassroom] == 'True'
			array << 'Playground' 						if facilities[:hasplayground] == 'True'
			array << 'Pool' 									if facilities[:haspool] == 'True'
			array << 'Science Lab'	 					if facilities[:hassciencelab] == 'True'
			return array.compact
		else
			return []
		end
	end

	def sports_list_helper(school)
		sports = school.api_sports
		if sports.present?
			array = []
			array << 'Baseball' 						if sports[:Baseball] == true
			array << 'Basketball' 					if (sports[:boyBasketball] == true || sports[:girlBasketball] == true)
			array << 'Cheerleading' 				if sports[:Cheer] == true
			array << 'Cross Country' 				if (sports[:boyCrossCountry] == true || sports[:girlCrossCountry] == true)
			array << 'Double Dutch' 				if (sports[:boyDoubleDutch] == true || sports[:girlDoubleDutch] == true)
			array << 'Football' 						if sports[:Football] == true
			array << 'Golf'									if sports[:Golf] == true
			array << 'Hockey' 							if sports[:Hockey] == true
			array << 'Indoor Track' 				if (sports[:boyIndoorTrack] == true || sports[:girlIndoorTrack] == true)
			array << 'Soccer' 							if (sports[:boySoccer] == true || sports[:girlSoccer] == true)
			array << 'Softball' 						if sports[:Softball] == true
			array << 'Swimming' 						if (sports[:boySwim] == true || sports[:girlSwim] == true)
			array << 'Tennis' 							if (sports[:boyTennis] == true || sports[:girlTennis] == true)
			array << 'Track' 								if (sports[:boyOutdoorTrack] == true || sports[:girlOutdoorTrack] == true)
			array << 'Volleyball' 					if (sports[:boyVolleyball] == true || sports[:girlVolleyball] == true)
			array << 'Wrestling' 						if sports[:Wrestling] == true
			return array.compact
		else
			return []
		end
	end

	def student_support_list_helper(school)
		student_support = school.api_student_support
		facilities = school.api_facilities
		if student_support.present? || facilities.present?
			array = []
			array << 'Family Coordinator'			if student_support.try(:[], :HasFamilyCoord) == 'True' if student_support.present?
			array << 'Full-Time Nurse'				if student_support.try(:[], :HasFullTimeNurse) == 'True' if student_support.present?
			array << 'Guidance Counselor'			if student_support.try(:[], :HasGuidanceCoord) == 'True' if student_support.present?
			array << 'Handicap Access'				if facilities.try(:[], :HandicappedAccess) == 'T' if facilities.present?
			array << 'Online Health Center' 	if student_support.try(:[], :HasOnlineHealthCntr) == 'True' if student_support.present?
			array << 'Part-Time Nurse'				if student_support.try(:[], :HasPartTimeNurse) == 'True' if student_support.present?
			array << 'Social Worker'					if student_support.try(:[], :HasSocialWorker) == 'True' if student_support.present?
			return array.compact
		else
			return []
		end
	end

	def programs_list_helper(school)
		programs = school.api_programs
		if programs.present?
			array = []
			array << 'Advanced Work Class'					if programs.try(:[], :HasAdvancedClassWork) == 'True'
			array << 'Advanced Placement'						if programs.try(:[], :HasAdvancedPlacement) == 'True'
			array << 'Arts' 												if programs.try(:[], :HasArts) == 'True'
			array << 'Dual Enrollment'							if programs.try(:[], :HasDualEnroll) == 'True'
			array << 'Dual Language'								if programs.try(:[], :HasDualLanguage) == 'True'
			array << 'ELL'													if programs.try(:[], :HasELL) == 'True'
			array << 'Health'												if programs.try(:[], :HasHealth) == 'True'
			array << 'Inclusion'										if programs.try(:[], :HasInclusion) == 'True'
			array << 'Internship'										if programs.try(:[], :HasInternship) == 'True'
			array << 'International Baccalaureate'	if programs.try(:[], :HasIntnlBaccalr) == 'True'
			array << 'Phys Education'								if programs.try(:[], :HasPhysicalEd) == 'True'
			array << 'SPED'													if programs.try(:[], :HasSPED) == 'True'
			array << 'STEAM'												if programs.try(:[], :HasSTEAM) == 'True'
			array << 'STEM'													if programs.try(:[], :HasSTEM) == 'True'
			array << 'Tech Focus'										if programs.try(:[], :HasTechFocus) == 'True'
			array << 'Vocational'										if programs.try(:[], :HasVocational) == 'True'
			array << 'World Language'								if programs.try(:[], :HasWorldLanguage) == 'True'
			return array.compact
		else
			return []
		end
	end

	def preview_dates_list_helper(school)
		preview_dates = school.api_preview_dates
		if preview_dates.present?
			array = []
			array << preview_dates[:PreviewDate1] 	if preview_dates.try(:[], :PreviewDate1).present?
			array << preview_dates[:PreviewDate2] 	if preview_dates.try(:[], :PreviewDate2).present?
			array << preview_dates[:PreviewDate3] 	if preview_dates.try(:[], :PreviewDate3).present?
			array << preview_dates[:PreviewDate4] 	if preview_dates.try(:[], :PreviewDate4).present?
			array << preview_dates[:PreviewDate5] 	if preview_dates.try(:[], :PreviewDate5).present?
			array << preview_dates[:PreviewDate6] 	if preview_dates.try(:[], :PreviewDate6).present?
			array.compact
		else
			return []
		end
	end

	def partners_list_helper(school)
		partners = school.api_partners
		if partners.present?
			list = []
			partners.each do |partner|
				list << partner[:description]
			end
			return list.compact
		else
			return []
		end
	end

	def school_validtier_helper(tier)
 		if tier.present?
 			if tier == 'NR'
 				return false
			elsif tier == 'N/A'
 				return false
 			elsif tier == 'NA'
 				return false	
			elsif tier == ''
				return false 				
 			else
 				return true
 			end			
 		else
 			return ''
 		end
 	end	

	def eligibility_helper(tier)
		tier.try(:gsub, /:/, ', ')
	end

	def school_tier_helper(tier)
		if tier.present?
			if tier == 'NR'
				tier_name = 'Not Ranked'
			elsif tier == 'N/A' || tier == 'NA'
				tier_name = 'N/A'
			else
				tier_name = tier
			end
			return tier_name
		else
			return ''
		end
	end	

	def school_distance_helper(walkdistance, distance)
		if walkdistance.present?  && walkdistance.strip != '0.00'
			return "#{walkdistance} mi"
		else
			return "#{distance} mi"
		end		
	end	

	def grade_levels_helper(array)
		if array.present?
			if array.length == 0
				"N/A"
			elsif array.length == 1
				array[0]
			else
				"#{array[0]} - #{array[-1]}"
			end
		else
			return nil
		end
	end

	def school_hours_start_time_helper(hours)
		if hours.present?
			hour 			= hours.match(/^\d*/).to_s.to_i
			minutes 	= hours.match(/^\d*:\d*/).to_s.gsub(/^\d*:/,'').to_s.to_i
			decimal 	= hour + (minutes / 60.0)
			range_percent = (decimal - 7) / 17
			(range_percent * 100).to_i
		else
			return ''
		end
	end

	def school_hours_end_time_helper(hours)
		if hours.present?
			hour 		= hours.gsub(/am/,'').gsub(/pm/,'').match(/-\s?\d*:/).to_s.gsub(/-\s?/,'').gsub(/:/,'').to_s.to_i
			minutes = hours.gsub(/am/,'').gsub(/pm/,'').match(/-\s?\d*:\d*/).to_s.gsub(/-\s?\d*:/,'').to_s.to_i
			hour += 12 if (hour > 0 && hour < 8) # add 12 if it's pm
			decimal = hour + (minutes / 60.0)
			range_percent = (17 - decimal) / 17
			(range_percent * 100).to_i
		end
	end

	def special_admissions_helper(string)
		if string.blank? || string == 'False' || string == 'false' || string == false
			'No'
		elsif string == 'True' || string == 'true' || string == true
			'Yes'
		end
	end

	def awc_helper(string)
		if string.blank? || string == 'No'
			'No'
		elsif string == 'Yes'
			'Yes'
		end
	end

	def spacer_helper(string)
		raw string.try(:strip).try(:gsub, /\s/, '&nbsp;')
	end

	def sql_helper_group_schoolId(schoolId, grade)
		if schoolId.present?
			if schoolId == '4241'
				schoolId = '4242'
			elsif schoolId == '1441'
				schoolId = '1440'				
			elsif schoolId == '4031'
				schoolId = '4033'				
			elsif schoolId == '4193'
				schoolId = '4192'				
			elsif schoolId == '4030'
				schoolId = '4410'							
			elsif schoolId == '4670'
				schoolId = '4151'
			elsif schoolId == '1194'
				schoolId = '‘1195’'
			elsif schoolId == '4391' || schoolId == '1140'
				if grade == '09'|| grade == '10' || grade =='11' || grade == '12'
					schoolId = '1140'
				else
					schoolId = '4391'	
				end	
			end
		end
		schoolId
	end	

	def sqf_helper_string(school_id, grade)
		format_school_id = sql_helper_group_schoolId(school_id, grade)
		# @reporting_ids from controller was not accessible without passing as an argument
		# moved to constant
		"https://lookerstudio.google.com/reporting/#{ENGLISH}/page/pzCYD?params=%7B%22df29%22:%22include%25EE%2580%25801%25EE%2580%2580IN%25EE%2580%2580#{format_school_id}%22%7D"
	end

	def generate_reporting_links(reporting_ids, home_school_ids)
		{
			english: encode_url(reporting_ids[:english], home_school_ids),
			spanish: encode_url(reporting_ids[:spanish], home_school_ids),
			arabic: encode_url(reporting_ids[:arabic], home_school_ids),
			cape_verdean: encode_url(reporting_ids[:cape_verdean], home_school_ids),
			chinese: encode_url(reporting_ids[:chinese], home_school_ids),
			french: encode_url(reporting_ids[:french], home_school_ids),
			haitian: encode_url(reporting_ids[:haitian], home_school_ids),
			portuguese: encode_url(reporting_ids[:portuguese], home_school_ids),
			somali: encode_url(reporting_ids[:somali], home_school_ids),
			vietnamese: encode_url(reporting_ids[:vietnamese], home_school_ids)
		}
	end

	def encode_url(reporting_id, values)
		values_array = values.is_a?(Array) ? values : values.split(',')
		# Encode the reporting_id
		encoded_reporting_id = URI.encode_www_form_component(reporting_id)

		# Format and encode the dynamic values
		encoded_values = values_array.map { |value| URI.encode_www_form_component(value) }.join('%25EE%2580%2580')

		# Construct the URL
		"https://lookerstudio.google.com/reporting/#{encoded_reporting_id}/page/pzCYD?params=%7B%22df29%22:%22include%25EE%2580%25801%25EE%2580%2580IN%25EE%2580%2580#{encoded_values}%22%7D"
	end

	def latest_demand_data(slug)
		TextSnippet.find_by(slug: slug).try(:text)
	end
end
