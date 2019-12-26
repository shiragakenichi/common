json.(@message, :content, :image)
json.user_name @message.user.nickname
json.user_image @message.user.image.url
json.created_at @message.created_at.strftime("%Y年%m月%d日 %H時%M分")
#idもデータとして渡す
json.id @message.id
