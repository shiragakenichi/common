class AlertsController < ApplicationController
  
  def syoutai
    @creuser =  User.find(params[:id])
    @group = Group.find(params[:group_id])
    if @alart = Alert.create(efect_id:current_user.id,group_id:@group.id,user_id:@creuser.id)
      redirect_to edit_group_path(@group.id)
    else
      redirect_to edit_group_path(@group.id)
    end
  end

  def destroy
    @canuser =  User.find(params[:id])
    @group = Group.find(params[:group_id])
    if Alert.find_by(group_id:@group.id,user_id:@canuser.id).destroy
      redirect_to edit_group_path(@group.id)
    else
      redirect_to edit_group_path(@group.id)
   end
  end
end
