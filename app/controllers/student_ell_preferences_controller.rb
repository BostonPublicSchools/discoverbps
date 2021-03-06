class StudentEllPreferencesController < ApplicationController

  def new
    if current_student.blank?
      redirect_to root_url
    end
  end

  def create

    respond_to do |format|
      if current_student && current_student.update_attributes(params[:student])
        unless current_student.ell_language.blank?
          current_student.set_ell_schools
        end

        format.js { render template: "student_sped_preferences/new" }
        format.html { redirect_to new_student_sped_preference_path }
      else
        format.js { render template: "student_ell_preferences/new" }
        flash[:alert] = 'There were problems with your search. Please complete the required fields and try again.'
        format.html { redirect_to root_url }
      end
    end
  end

end
