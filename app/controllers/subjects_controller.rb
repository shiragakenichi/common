class SubjectsController < ApplicationController
  def index
      if user_signed_in?
        @user = current_user
        @groups = @user.groups
        ints= Relationship.where(follower_id:@user.id).select(:following_id)
        @matchi = @user.followers.where(id:ints)
        if @matchi.count == 0
          @sinsei = @user.followers
          # @sinsei = @user.followers.where.not(@user.matchers)
        else
          ooo = @matchi.select(:id)
          @sinsei = @user.followers.where.not(id:ooo)
        end
      else
      end
  
  end

end
