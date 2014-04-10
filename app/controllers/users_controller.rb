class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit,:update]
  before_action :authenticate_user!

  def index
    users
  end

  def show

    @user.create_profile if @user.profile.nil?

  end

  def edit
    @user.build_profile if @user.profile.nil?
  end

  def update
    if @user.update(user_params)
      if params[:user][:image].present?
        render :crop
      else
        redirect_to @user, notice: 'User was successfully updated.'
      end
    else
      render action: 'edit'
    end
  end

private
  def users
    @users ||= User.all
  end
  helper_method :users

  def find_user
    @user ||= User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username,:image,:remote_image_url,:mobile, :crop_x,:crop_y,:crop_w,:crop_h,
      profile_attributes: [:bio,:lab, :url,:twitter,:linkedin,:google,:mobile])
  end

end