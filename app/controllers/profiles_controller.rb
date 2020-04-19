class ProfilesController < ApplicationController

  before_action :set_profile, only: [:show, :edit, :update]

  def show
  end

  def new
    @profile = current_user.build_profile
    render :layout => false
  end

  def edit
  end

  def create
    @profile = current_user.build_profile(profile_params)
    if @profile.save
      redirect_to profile_path(@profile), notice: 'Profile was successfully created.'
    else
      render :new
    end
  end

  def update
    if current_user.profile.update(profile_params)
      redirect_to profile_path(@profile), notice: 'Profile was successfully updated.'
    else
      render :edit
    end
  end

  private

    def set_profile
      @profile = current_user.profile
    end

    def profile_params
      params.require(:profile).permit(:self_introduction, :birthday, :live_in, :image)
    end

end