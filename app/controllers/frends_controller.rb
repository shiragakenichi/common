class FrendsController < ApplicationController
    def index
      @frends = current_user.matchers
      @user = current_user
    end
end
