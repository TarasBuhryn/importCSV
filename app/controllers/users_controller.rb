# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  def index
    @users = Import.find(params[:import_id]).users
  end

  def import
    current_import = Import.find(params[:import_id])
    file           = current_import.file
    User.import(file, current_import)
    redirect_back(fallback_location: url_for(@import))
  end

  def show; end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'User added!'
      redirect_to root_path
    else
      flash[:error] = 'Failed to edit user!'
      render :new
    end
  end

  def edit; end

  def update
    if @user.update_attributes(user_params)
      flash[:notice] = 'User updated!'
      redirect_to root_path
    else
      flash[:error] = 'Failed to edit user!'
      render :edit
    end
  end

  def destroy
    if @user.delete
      flash[:notice] = 'User deleted!'
      redirect_to root_path
    else
      flash[:error] = 'Failed to delete this user!'
      render :destroy
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:import_id, :first_name, :last_name, :email, :date_of_birth)
  end
end
