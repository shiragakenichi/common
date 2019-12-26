json.array! @messages do |message|
  json.content message.content
  json.image message.image
  json.created_at message.created_at.strftime("%Y/%m/%d %H:%M")
  json.user_name message.user.nickname
  json.user_image message.user.image_url
  json.id message.id
end