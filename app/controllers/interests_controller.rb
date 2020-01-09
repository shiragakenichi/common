class InterestsController < ApplicationController
  def index
  end

  def show
    @interest = Interest.find(params[:id])
  end

  def tag
    @interest = Interest.find(params[:id])
    current_user.tagfllow!(current_user,@interest)
    redirect_to interest_path(@interest.id)
  end

  def untag
    @interest = Interest.find(params[:id])
    current_user.untagfllow!(current_user,@interest)
    redirect_to interest_path(@interest.id)
  end

end
