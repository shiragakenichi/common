class ChatsController < ApplicationController

  def index
    @user =  User.find(params[:user_id])
    @chat = Chat.new
    @chats = Chat.where(user_id:current_user.id).where(send_id:@user.id)
  end

  def create
    @user =  User.find(params[:user_id])
    @chat = Chat.new(chat_params)
    @chat.send_id = @user.id
    if @chat.save
      redirect_to user_chats_path
    else
      @chats = Chat.where(user_id:@user.id).where(user_id:current_user.id)
      flash.now[:alert] = 'メッセージを入力してください。'
      render :index
    end
  end

  private

  def chat_params
    params.require(:chat).permit(:content, :image).merge(user_id: current_user.id)
  end
end
