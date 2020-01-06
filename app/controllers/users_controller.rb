class UsersController < ApplicationController
  def index
    @users = User.all
    @user = current_user
    @groups = @user.groups
  end
  
  def new
    @user = User.new
  end

  def newsns
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

  def edit
    @user = User.find(params[:id])
  end

  def create
    binding.pry
    @user = User.create(user_params)
    sign_in(@user) unless user_signed_in?
    if user_signed_in?
      redirect to new_user_profile_path
    else
      redirect to new_user_path
    end
  end

  def show
    @user = User.find(params[:id])
    @profile = @user.profile
    age = @profile.birth_year + @profile.birth_month + @profile.birth_day
    ages = Date.today.strftime("%Y%m%d").to_i - age.to_i 
    @age = ages/10000
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
