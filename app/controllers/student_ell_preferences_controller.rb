class StudentEllPreferencesController < ApplicationController
  def new
    return unless current_student.blank?

    redirect_to root_url
  end

  def create
    respond_to do |format|
      if current_student&.update(student_params) # Use strong params here
        current_student.set_ell_schools unless current_student.ell_language.blank?

        format.js { render template: "student_sped_preferences/new" }
        format.html { redirect_to new_student_sped_preference_path }
      else
        format.js { render template: "student_ell_preferences/new" }
        flash[:alert] = "There were problems with your search. Please complete the required fields and try again."
        format.html { redirect_to root_url }
      end
    end
  end

  private

  # Make sure all required fields are permitted here
  def student_params
    # List all attributes that you need to allow for the Student model
    params.require(:student).permit(:ell_language, :first_name, :last_name, :grade)
  end
end
