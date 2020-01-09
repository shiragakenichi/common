class Users::SearchesController < ApplicationController
  def index
      @keyword = params[:keyword]
      @gend = params[:gender]
      @pre = params[:prefectures]
    iii = User.search(params[:keyword])
    bbb = iii.where.not(id:current_user.id )
    if params[:gender] == ''
      rs = bbb
    else
      sss = Profile.where(gender:params[:gender]).select(:user_id)
      rs = bbb.where(id:sss)
    end

    if  params[:prefectures] ==  ''
      @users = rs
    else
      eee = Profile.where(prefectures:params[:prefectures]).select(:user_id)
      @users = rs.where(id:eee)
    end
  end


end
