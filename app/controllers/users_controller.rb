class UsersController < ApplicationController
  def index
    session[:path_back_from_profile] = users_path
  end

  def followindex
    @user = User.find(params[:id])
    session[:path_back_from_profile] = followindex_path(@user)
  end

  def followerindex
    @user = User.find(params[:id])
    session[:path_back_from_profile] = followerindex_path(@user)
  end
end