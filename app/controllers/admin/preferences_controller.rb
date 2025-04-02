class Admin::PreferencesController < ApplicationController
  before_action :authenticate_admin!
  layout 'admin'

  def index
    @preference_categories = PreferenceCategory.rank(:sort_order)
  end

  def new
    @preference = Preference.new
  end

  def create
    @preference = Preference.new(preference_params)

    respond_to do |format|
      if @preference.save
        format.html { redirect_to admin_preferences_url, notice: 'Preference was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def edit
    @preference = Preference.find(params[:id])
  end

  def update
    @preference = Preference.find(params[:id])

    respond_to do |format|
      if @preference.update(preference_params)
        format.html { redirect_to admin_preferences_url, notice: 'Preference was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @preference = Preference.find(params[:id])
    @preference.destroy

    respond_to do |format|
      format.html { redirect_to admin_preferences_url }
    end
  end

  def sort
    id = params['preference']['id'].gsub(/preference_/, '')
    Preference.find(id).update_attribute(:sort_order_position, params['preference']['sort_order'])
    render nothing: true
  end

  private

  # Strong parameters for Preference
  def preference_params
    params.require(:preference).permit(
      :name, :preference_category_id, :grade_k0, :grade_k1, :grade_k2, :grade_1, :grade_2, :grade_3,
      :grade_4, :grade_5, :grade_6, :grade_7, :grade_8, :grade_9, :grade_10, :grade_11, :grade_12,
      :api_table_name, :api_table_key, :api_table_value, :sort_order_position
    )
  end
end
