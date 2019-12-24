class SubjectsController < ApplicationController
  def index
      if user_signed_in?
        @user = current_user
        @groups = @user.groups
      else
      end
  
  end
end
