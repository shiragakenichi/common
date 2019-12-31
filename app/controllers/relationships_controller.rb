class RelationshipsController < ApplicationController
  def create
    @user = User.find(params[:relationship][:following_id])
    current_user.follow!(@user)
    redirect_to users_path
    respond_to do |format|
      format.html { redirect_to users_path }
      format.js
    end
  end

  def destroy
    @user = Relationship.find(params[:id]).following
    current_user.unfollow!(@user)
    redirect_to users_path
    respond_to do |format|
      format.html { redirect_to users_path }
      format.js
    end
  end
end

def unfollow!(other_user)
  following_relationships.find_by(following_id: other_user.id).destroy
end
