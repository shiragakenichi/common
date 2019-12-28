class GroupsController < ApplicationController
  before_action :set_group, only: [:edit, :update]
  def index
    @user = current_user
  end

  def new
    @user = current_user
    @group = Group.new
    @users = User.all
    @group.users << current_user
  end

  def edit
    @user = current_user
    @users = User.all
  end

  def update
    if @group.update(group_params)
      redirect_to root_path, notice: 'グループを更新しました'
    else
      render :edit
    end
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to "/groups/#{@group.id}/messages", notice: 'グループを作成しました'
    else
      render :new
    end
  end

  private
   def group_params
    params.require(:group).permit(:name, { :user_ids => [] })
  end

  def set_group
    @group = Group.find(params[:id])
  end

end
