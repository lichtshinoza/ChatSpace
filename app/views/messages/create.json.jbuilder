
  json.user_name  @message.user.name
  json.data  @message.created_at.strftime('%d.%m.%Y, %H:%M')
  json.user_id  @message.user.id
  json.id  @message.id
  json.image  @message.image
  json.msg  @message.msg
  json.image_url  @message.image.url
  json.group_id  @message.group.id
