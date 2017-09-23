json.array! @new_messages.each do |message|
  json.user_name     message.user.name
  json.date     message.created_at.strftime('%d.%m.%Y, %H:%M')
  json.msg      message.msg
  json.image    message.image
  json.id       message.id
end
