# frozen_string_literal: true

class ImportsController < ApplicationController
  before_action :set_import, only: %i[show edit update destroy]

  def index
    @imports = Import.all
  end

  def show; end  

  def new
    @import = Import.new
  end

  def create
    @import = Import.new(import_params)

    if @import.save
      flash[:notice] = 'New import added!'
      redirect_to url_for(@import)
    else
      flash[:error] = 'Failed to create import!'
      render :new
    end
  end

  def edit; end

  def update
    if @import.update_attributes(import_params)
      flash[:notice] = 'Import updated!'
      redirect_to import_path
    else
      flash[:error] = 'Failed to edit import!'
      render :edit
    end
  end

  def destroy
    if @import.delete
      flash[:notice] = 'Import deleted!'
      redirect_to imports_path
    else
      flash[:error] = 'Failed to delete this import!'
      render :destroy
    end
  end

  def import
    ImportProcessor.new(params[:id]).import_csv
    redirect_back(fallback_location: url_for(@import))
  end

  def users
    @users = Import.find(params[:id]).users
  end

  private

  def set_import
    @import = Import.find(params[:id])
  end

  def import_params
    params.require(:import).permit(:file, :title)
  end
end
