class UsersController < ApplicationController
  def index
    @users = User.all
    @user = current_user
    @groups = @user.groups
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
end
