class ProfilesController < ApplicationController

  before_action :set_profile, only: [:show, :edit, :update]

  def show
    @tweets = Tweet.where(user_id: params[:id]).order(created_at: :desc)
    @user = User.find(params[:id])
  end

  def new
    @profile = current_user.build_profile
    render layout: "login"
  end

  def edit
  end

  def create
    @profile = current_user.build_profile(profile_params)
    if @profile.save
      redirect_to profile_path(@profile), notice: '新規登録完了'
    else
      render :new
    end
  end

  def update
    if current_user.profile.update(profile_params)
      redirect_to profile_path(@profile), notice: '更新完了'
    else
      render :edit
    end
  end

  private

    def set_profile
      @profile = Profile.find_by(user_id: params[:id])
    end

    def profile_params
      params.require(:profile).permit(:self_introduction, :birthday, :live_in, :image)
    end

end
