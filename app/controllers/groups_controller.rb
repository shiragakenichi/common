class GroupsController < ApplicationController
  before_action :set_group, only: [:edit, :update, :destroy]
  def index
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

  def destroy
  @user = current_user
  current_user.ungroup!(@user,@group)
  amessage = @user.nickname + 'が退出しました'
  @message = Message.new(content: amessage , group_id: @group.id , user_id: @user.id)
  @message.save
  redirect_to root_path
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
