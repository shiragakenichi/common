class Chat < ApplicationRecord
  belongs_to :user
  validates :content, presence: true, unless: :image?
  mount_uploader :image, ImageUploader
  def show_last_chat
    if (last_chat = chats.last).present?
      last_chat.content? ? last_chat.content : '画像が投稿されています'
    else
      'まだメッセージはありません。'
    end
  end
end
