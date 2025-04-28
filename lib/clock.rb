# frozen_string_literal: true

require File.expand_path("../config/boot", __dir__)
require File.expand_path("../config/environment", __dir__)

require "clockwork"
include Clockwork

handler do |job|
  puts "Running #{job}"
end

# 9 UTC = 3am EST and 12am PST
every(1.day, "Update school basic info", at: "6:00", tz: "America/New_York") do
  SchoolDataJob.perform_later(:update_basic_info)
end

every(1.day, "Update school awards", at: "6:01", tz: "America/New_York") do
  SchoolDataJob.perform_later(:update_awards)
end

every(1.day, "Update school descriptions", at: "6:02", tz: "America/New_York") do
  SchoolDataJob.perform_later(:update_descriptions)
end

every(1.day, "Update school facilities", at: "6:03", tz: "America/New_York") do
  SchoolDataJob.perform_later(:update_facilities)
end

every(1.day, "Update school grades", at: "6:04", tz: "America/New_York") do
  SchoolDataJob.perform_later(:update_grades)
end

every(1.day, "Update school hours", at: "6:05", tz: "America/New_York") do
  SchoolDataJob.perform_later(:update_hours)
end

every(1.day, "Update school languages", at: "6:06", tz: "America/New_York") do
  SchoolDataJob.perform_later(:update_languages)
end

every(1.day, "Update school partners", at: "6:07", tz: "America/New_York") do
  SchoolDataJob.perform_later(:update_partners)
end

every(1.day, "Update school photos", at: "6:08", tz: "America/New_York") do
  SchoolDataJob.perform_later(:update_photos)
end

every(1.day, "Update school preview dates", at: "6:09", tz: "America/New_York") do
  SchoolDataJob.perform_later(:update_preview_dates)
end

every(1.day, "Update school programs", at: "6:10", tz: "America/New_York") do
  SchoolDataJob.perform_later(:update_programs)
end

every(1.day, "Update school sports", at: "6:11", tz: "America/New_York") do
  SchoolDataJob.perform_later(:update_sports)
end

every(1.day, "Update school student support", at: "6:12", tz: "America/New_York") do
  SchoolDataJob.perform_later(:update_student_support)
end

every(1.day, "Update school surround care", at: "6:13", tz: "America/New_York") do
  SchoolDataJob.perform_later(:update_surround_care)
end

every(6.hours, "Store searches json") do
  StoredSearch.first_or_create.update(json: Student.order(:last_name).to_json(
    only: %i[grade_level latitude longitude zipcode ell_language sped_needs awc_invitation
      preferences_count], methods: :created_at_date
  ))
end
