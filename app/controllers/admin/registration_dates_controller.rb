class Admin::RegistrationDatesController < ApplicationController
  before_action :authenticate_admin!
  layout "admin"

  def index
    @registration_dates = RegistrationDate.order(:start_date)
  end

  def new
    @registration_date = RegistrationDate.new
  end

  def create
    @registration_date = RegistrationDate.new(registration_date_params)

    respond_to do |format|
      if @registration_date.save
        format.html do
          redirect_to admin_registration_dates_url, notice: "Registration date was successfully created."
        end
      else
        format.html { render action: "new" }
      end
    end
  end

  def edit
    @registration_date = RegistrationDate.find(params[:id])
  end

  def update
    @registration_date = RegistrationDate.find(params[:id])

    respond_to do |format|
      if @registration_date.update(registration_date_params)
        format.html do
          redirect_to admin_registration_dates_url, notice: "Registration date was successfully updated."
        end
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @registration_date = RegistrationDate.find(params[:id])
    @registration_date.destroy

    respond_to do |format|
      format.html { redirect_to admin_registration_dates_url }
    end
  end

  private

  # Strong parameters for RegistrationDate
  def registration_date_params
    params.require(:registration_date).permit(:start_date, :end_date, :name)
  end
end
