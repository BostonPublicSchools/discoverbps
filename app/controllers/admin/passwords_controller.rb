# frozen_string_literal: true

class Admin::PasswordsController < Devise::PasswordsController
  before_action :authenticate_admin!
  layout "admin"
end
