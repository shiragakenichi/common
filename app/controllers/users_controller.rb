class UsersController < ApplicationController
  def index
    @users = User.all
    @user = current_user
    @groups = @user.groups
  end

  def new
    if session[:password_confirmation]
      
      @user = User.new(
        nickname: session[:nickname],
        email: session[:email],
        password: session[:password_confirmation]
      )
    else
      @user = User.new
    end
  end

  def create
    @user = User.create(user_params)
    sign_in(@user) unless user_signed_in?
    redirect to root_path
  end

  def show
    @user = User.find(params[:id])
    @relationship = Relationship.new
  end

  def following
    @title = "フォロー"
    @user = User.find(params[:id])
    @users = @user.followings
    render 'show_follow'
  end

  def followers
    @title = "フォロワー"
    @user = User.find(params[:id])
    @users = @user.followers
    render 'show_follow'
  end


  private
  def user_params
    params.require(:user).permit(
      :nickname, 
      :email, 
      :password, 
      :password_confirmation
  )
  end
end
