class ProfilesController < ApplicationController

  before_action :set_profile, only: [:show, :edit, :update]

  def show
    @tweets = Tweet.where(user_id: params[:id]).order(created_at: :desc)
    @user = User.find(params[:user_id])
    session[:path_back_from_tweet] = user_profile_path(@user, @user.profile)
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
      redirect_to users_path, notice: '新規登録完了。まずは誰かをフォローしてみよう！'
    else
      render :new
    end
  end

  def update
    if current_user.profile.update(profile_params)
      redirect_to user_profile_path(current_user, @profile), notice: '更新完了'
    else
      render :edit
    end
  end

  private

    def set_profile
      @profile = Profile.find_by(user_id: params[:user_id])
    end

    def profile_params
      params.require(:profile).permit(:self_introduction, :birthday, :live_in, :image)
    end

end