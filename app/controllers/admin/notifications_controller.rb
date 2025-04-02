# frozen_string_literal: true

class Admin::NotificationsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_notification, only: %i[edit update destroy]
  layout 'admin'

  def index
    @notifications = Notification.order(start_time: :desc)
  end

  def new
    @notification = Notification.new
  end

  def create
    @notification = Notification.new(notification_params)

    if @notification.save
      redirect_to admin_notifications_url, notice: 'Notification was successfully created.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @notification.update(notification_params)
      redirect_to admin_notifications_url, notice: 'Notification was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @notification.destroy
    redirect_to admin_notifications_url, notice: 'Notification was successfully deleted.'
  end

  private

  def set_notification
    @notification = Notification.find(params[:id])
  end

  def notification_params
    params.require(:notification).permit(:end_time, :message, :start_time, :home_page, :schools_page,
                                         :school_choice_pages)
  end
end
