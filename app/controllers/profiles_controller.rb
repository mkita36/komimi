class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :update, :destroy]
  before_action :set_profile_user_id, only: :edit

  def index
    @profiles = Profile.all
  end

  def show
  end

  def new
    @profile = Profile.new(user_id: current_user.id)
  end

  def edit
  end

  def create
    @profile = Profile.new(profile_params)
      if @profile.save
        redirect_to tweets_path, notice: 'Profile was successfully created.'
      else
        render :new
      end
  end

  def update
      if @profile.update(profile_params)
        redirect_to tweets_path, notice: 'Profile was successfully updated.'
      else
        render :edit
      end
  end

  def destroy
    @profile.destroy
      redirect_to profiles_url, notice: 'Profile was successfully destroyed.'
  end

  private
    def set_profile
      @profile = Profile.find(params[:id])
    end

    def set_profile_user_id
      @profile = Profile.find_by(user_id:params[:id])
    end

    def profile_params
      params.require(:profile).permit(:user_id, :self_introduction, :birth_year, :live_in)
    end
end
