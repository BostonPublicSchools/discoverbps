# frozen_string_literal: true

class Admin::TextSnippetsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_text_snippet, only: %i[edit update destroy]
  layout 'admin'

  def index
    @text_snippets = TextSnippet.order(:location)
  end

  def new
    @text_snippet = TextSnippet.new
  end

  def create
    @text_snippet = TextSnippet.new(text_snippet_params)

    if @text_snippet.save
      redirect_to admin_text_snippets_url, notice: 'Text Snippet was successfully created.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @text_snippet.update(text_snippet_params)
      redirect_to admin_text_snippets_url, notice: 'Text Snippet was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @text_snippet.destroy
    redirect_to admin_text_snippets_url, notice: 'Text Snippet was successfully deleted.'
  end

  private

  def set_text_snippet
    @text_snippet = TextSnippet.find(params[:id])
  end

  def text_snippet_params
    params.require(:text_snippet).permit(:location, :text, :slug)
  end
end
