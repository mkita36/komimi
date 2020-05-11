class ProfilesController < ApplicationController

  before_action :set_profile, only: %i(edit update)

  def show
    @profile = Profile.find(params[:id])
    @user = User.find(params[:user_id])
    @tweets = Tweet.where(user_id: params[:user_id]).order(created_at: :desc)
    session[:path_back_from_tweet] = user_profile_path(current_user)
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
      render :new, layout: "login"
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
      @profile = current_user.profile
    end

    def profile_params
      params.require(:profile).permit(:self_introduction, :birthday, :live_in, :image)
    end

end