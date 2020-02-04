class UsersController < ApplicationController
  def index
    @user = current_user
    @users = User.where.not(id:@user.id )
    @groups = @user.groups
  end
  
  def new
    @user = User.new
  end


  def edit
    @user = User.find(params[:id])
    if @user == current_user
      @profile = @user.profile
    else
      redirect_to user_path(@user.id)
    end
  end

  def update
    @user = current_user
    @user.update(user_params)
    @user.profile.update(profile_params)
    redirect_to user_path(@user.id)
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

  def show
    @user = User.find(params[:id])
    @profile = @user.profile
    @interests = @user.interests
    if (@profile.birth_year != '---' ) && (@profile.birth_month != '---' ) &&  (@profile.birth_day != '---')
      age = @profile.birth_year + @profile.birth_month + @profile.birth_day
      ages = Date.today.strftime("%Y%m%d").to_i - age.to_i 
      @age = ages/10000
    else
      @age = '生年月日未登録'
    end
  end

  def tag
    @user = User.find(params[:id])
    if @user == current_user
      @interest = Interest.new
      @myinterests = @user.interests
      if @user.interests.blank?
        @interests = Interest.all
      else
        ints= InterestUser.where(user_id:@user.id).select(:interest_id)
        @interests = Interest.where.not(id: ints)
      end
    else
      redirect_to user_path(@user.id)
    end
  end


  def taguser
    @interest = Interest.find(params[:id])
    current_user.tagfllow!(current_user,@interest)
    redirect_to tag_user_path(current_user.id)
  end

  def tagcreate
    @interest = Interest.create(interest_params)
    @int = InterestUser.create(user_id:current_user.id, interest_id:@interest.id)
    redirect_to  tag_user_path(current_user.id)
  end

  def untag
    @interest = Interest.find(params[:id])
    current_user.untagfllow!(current_user,@interest)
    redirect_to tag_user_path(current_user.id)
  end

  def tagsearch
    @user = User.find(params[:id])
    if @user == current_user
      @interest = Interest.new
      @myinterests = @user.interests
      if @user.interests.blank?
        @interests = Interest.tsearch(params[:keyword])
      else
        ints= InterestUser.where(user_id:@user.id).select(:interest_id)
        sss = Interest.tsearch(params[:keyword])
        @interests = sss.where.not(id: ints)
      end
    else
      redirect_to user_path(@user.id)
    end
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

  def profile_params
    @aaa = params[:user]
    @aaa.require(:profile).permit(
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
