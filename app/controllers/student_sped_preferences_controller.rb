# frozen_string_literal: true

class StudentSpedPreferencesController < ApplicationController
  def new
    return unless current_student.blank?

    redirect_to root_url
  end

  def create
    respond_to do |format|
      if current_student&.update(student_params) # Update using student_params instead of directly using params[:student]
        current_student.set_sped_schools if current_student.sped_needs == true

        format.html { redirect_to schools_path }
        format.js { render js: "window.location = '/schools'" }
      else
        format.js { render template: 'student_sped_preferences/new' }
        flash[:alert] = 'There were problems with your search. Please complete the required fields and try again.'
        format.html { redirect_to root_url }
      end
    end
  end

  private

  # Permit all the necessary parameters
  def student_params
    params.require(:student).permit(:sped_needs)
  end
end
