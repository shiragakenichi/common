class FrendsController < ApplicationController
    def index
      @user = current_user
      ints= Relationship.where(follower_id:@user.id).select(:following_id)
      @frends = @user.followers.where(id:ints)
    end
end
