class UsersController < ApplicationController
  def index
    @users = User.all.where.not(id: current_user.id).page(params[:page])
    session[:path_back_from_profile] = users_path
  end

  def followindex
    @user = User.find(params[:id])
    @follows = @user.following_user.page(params[:page])
    session[:path_back_from_profile] = followindex_path(@user)
  end

  def followerindex
    @user = User.find(params[:id])
    @followers = @user.follower_user.page(params[:page])
    session[:path_back_from_profile] = followerindex_path(@user)
  end
end