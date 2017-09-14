class MessagesController < ApplicationController

  def index
    @groups = current_user.groups
    @group_members = @groups.find(params[:group_id]).users
    @messages = Message.new
    # @users = current_user.groups.user
  end

  def create
    @messages = Message.new(messages_params)
    if @messages.save
      redirect_to group_messages_path, notice: "メッセージが投稿されました。"
    else
      redirect_to group_messages_path, alert: "投稿内容が空欄です。"
    end
  end
  private
  def messages_params
    params.require(:message).permit(:msg, :image).merge(user_id: current_user.id, group_id: params[:group_id])
  end
end
