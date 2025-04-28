# frozen_string_literal: true

class StudentAwcPreferencesController < ApplicationController
  def new
    return unless current_student.blank?

    redirect_to root_url
  end

  def create
    respond_to do |format|
      if current_student&.update(params[:student])
        session[:is_AWC] = (params["student"]["awc_invitation"] == "true") ? "Y" : "N"

        # the home schools call must always preceed zone schools
        current_student.set_home_schools(session[:is_AWC])
        session[:is_AWC] = nil

        format.js { render template: "student_ell_preferences/new" }
        format.html { redirect_to new_student_ell_preference_path }
      else
        format.js { render template: "student_awc_preferences/new" }
        flash[:alert] = "There were problems with your search. Please complete the required fields and try again."
        format.html { redirect_to root_url }
      end
    end
  end
end
