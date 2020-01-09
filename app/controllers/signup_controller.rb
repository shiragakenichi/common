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
    @profile = current_user.profile
  end

  def step3
    @user = current_user
    @interest = Interest.new
    @myinterests = @user.interests
    if @user.interests.blank?
      @interests = Interest.all
    else
      ints= InterestUser.where(user_id:@user.id).select(:interest_id)
      @interests = Interest.where.not(id: ints)
    end
  end

  def step3create
    @interest = Interest.create(interest_params)
    @int = InterestUser.create(user_id:current_user.id, interest_id:@interest.id)
    redirect_to step3_signup_index_path
  end

  def create
    @user = User.create(user_params)
      if @user.save
        Profile.create(user_id:@user.id,gender:'---', prefectures:'---',birth_year:'---',birth_month:'---',birth_day:'---')
        sign_in(@user) unless user_signed_in?
        if user_signed_in?
          redirect_to step2_signup_index_path
        else
          redirect_to step1_signup_index_path
        end
      else
        redirect_to step1_signup_index_path
      end
  end

  def step2create
    current_user.profile.destroy
    @profile = Profile.create(profile_params)
    redirect_to step3_signup_index_path
  end

  def tag
    @interest = Interest.find(params[:id])
    current_user.tagfllow!(current_user,@interest)
    redirect_to step3_signup_index_path
  end

  def untag
    @interest = Interest.find(params[:id])
    current_user.untagfllow!(current_user,@interest)
    redirect_to step3_signup_index_path
  end

  
  private
  def user_params
    params.require(:user).permit(
      :nickname,
      :image ,
      :email, 
      :password, 
      :password_confirmation
  )
  end

  def profile_params
    params.require(:profile).permit(
      :introduction, 
      :gender, 
      :prefectures, 
      :birth_year,
      :birth_month,
      :birth_day
    ).merge(user_id: current_user.id)
  end

  def interest_params
    params.require(:interest).permit(
      :tag,
      :imagelist
    )
  end


end
