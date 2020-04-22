class UsersController < ApplicationController
  def index
  end

  def followindex
    @user = User.find(params[:id])
  end

  def followerindex
    @user = User.find(params[:id])
  end
end