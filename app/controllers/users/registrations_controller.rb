# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # POST /resource
  def create
    build_resource(sign_up_params)

    respond_to do |format|
      if resource.save!
        yield resource if block_given?
        if resource.active_for_authentication?
          # set_flash_message :notice, :signed_up if is_flashing_format?
          sign_up(resource_name, resource)
          logger.info '****************** resource active_for_authentication?'
        else
          # set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
          expire_data_after_sign_in!
          logger.info '****************** resource not active_for_authentication'
        end
        format.json { render json: { success: true } }
      else
        clean_up_passwords resource
        logger.info '****************** resource not saved'
        format.json { render json: { success: false, errors: ['Signup failed.'] } }
      end
      format.html { redirect_to root_url }
    end
  end
end
