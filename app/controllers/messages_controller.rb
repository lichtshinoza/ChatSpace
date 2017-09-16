class MessagesController < ApplicationController

  def index
    @group = Group.includes(:users).find(params[:group_id])
    @message = Message.new
    @messages = @group.messages
  end

  def create
    @group = Group.find(params[:group_id])
    @message = Message.new(messages_params)
    if @message.save
      redirect_to group_messages_path, notice: "メッセージが投稿されました。"
    else
      redirect_to group_messages_path, alert: "投稿内容が空欄です。"
    end
  end

  def destroy
    message = Message.find(params[:id])
    message.destroy if message.user_id == current_user.id
    redirect_to group_messages_path, notice: "メッセージを削除しました。"
  end

  private
  def messages_params
    params.require(:message).permit(:msg, :image).merge(user_id: current_user.id, group_id: params[:group_id])
  end
end
