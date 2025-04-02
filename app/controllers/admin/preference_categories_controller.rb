class Admin::PreferenceCategoriesController < ApplicationController
  before_action :authenticate_admin!
  layout 'admin'

  def index
    @preference_categories = PreferenceCategory.rank(:sort_order)
  end

  def new
    @preference_category = PreferenceCategory.new
  end

  def create
    @preference_category = PreferenceCategory.new(preference_category_params)

    respond_to do |format|
      if @preference_category.save
        format.html { redirect_to admin_preferences_url, notice: 'Preference category was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def edit
    @preference_category = PreferenceCategory.find(params[:id])
  end

  def update
    @preference_category = PreferenceCategory.find(params[:id])

    respond_to do |format|
      if @preference_category.update(preference_category_params)
        format.html { redirect_to admin_preferences_url, notice: 'Preference category was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @preference_category = PreferenceCategory.find(params[:id])
    @preference_category.destroy

    respond_to do |format|
      format.html { redirect_to admin_preferences_url }
    end
  end

  def sort
    id = params['preference_category']['id'].gsub(/preference_category_/, '')
    PreferenceCategory.find(id).update_attribute(:sort_order_position, params['preference_category']['sort_order'])
    render nothing: true
  end

  private

  # Strong parameters for PreferenceCategory
  def preference_category_params
    params.require(:preference_category).permit(
      :name,
      :description,
      :sort_order,
      :qualitative_criteria,
      :include_in_special_needs_dialog_box,
      :include_in_preferences_panel,
      :select_type,
      :glyph_id,
      :glyph_class
    )
  end
end
