class GroupsController < ApplicationController
  before_action :set_group, only: [:edit, :update, :destroy,:join,:show]
  before_action :set_frend
  def index
    
  end

  def new
    @group = Group.new
    # @users = User.all
    @users = @frend.where.not(id:@user.id)
    # @group.users << current_user
  end

  def show
  end

  def edit
    @user = current_user
    sss = GroupUser.where(group_id:@group.id).select(:user_id)
    ppp = Alert.where(group_id:@group.id).select(:user_id)
    nusers = @frend.where.not(id:sss)
    @syoutai_sitai = nusers.where.not(id:ppp)
    @syoutai_tyuu = nusers.where(id:ppp)
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
      redirect_to edit_group_path
    end
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      params[:group][:user_ids].each do |u|
      @alart = Alert.create(efect_id:current_user.id,group_id:@group.id,user_id:u)
      end
      current_user.crgroup!(@group,current_user)
      redirect_to "/groups/#{@group.id}/messages", notice: 'グループを作成しました'
    else
      redirect_to new_group_path
    end
  end

  def join
    GroupUser.create(group_id:@group.id,user_id:current_user.id)
    Alert.find_by(group_id:@group.id,user_id:current_user.id).destroy
    redirect_to group_messages_path(@group.id)
  end

  private
   def group_params
    # params.require(:group).permit(:name, { :user_ids => [] })
    params.require(:group).permit(:name)
  end

  def set_group
    @group = Group.find(params[:id])
  end

  def set_frend
    @user = current_user
    ints= Relationship.where(follower_id:@user.id).select(:following_id)
    @frend = @user.followers.where(id:ints)
  end

end
