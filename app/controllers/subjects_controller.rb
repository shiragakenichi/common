class SubjectsController < ApplicationController

  def index
      if user_signed_in?
        @user = current_user
        @groups = @user.groups
        ints= Relationship.where(follower_id:@user.id).select(:following_id)
        @matchi = @user.followers.where(id:ints)
        @chats = Chat.where(user_id:@user.id) + Chat.where(send_id:@user.id)
        aaa = Chat.where(user_id:@user.id).select(:send_id)
        ppp = Chat.where(send_id:@user.id).select(:user_id)
        @chat_user = User.where.not(id:@user.id).where(id:aaa) + User.where.not(id:@user.id).where(id:ppp)
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
