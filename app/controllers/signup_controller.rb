class SignupController < ApplicationController
  
  def step1
    @user = User.new
  end

  def step1sns
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

  def step2
    @profile = Profile.new
  end

  def create
    @user = User.create(user_params)
    sign_in(@user) unless user_signed_in?
    if user_signed_in?
      redirect to new_user_profile_path
    else
      redirect to new_user_path
    end
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
