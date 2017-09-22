class MessagesController < ApplicationController
  before_action :authenticate_user!
  def index
    @group = Group.includes(:users).find(params[:group_id])
    @message = Message.new
    @messages = @group.messages
    respond_to do |format|
      format.html
      format.json
    end
  end

  def create
    @group = Group.find(params[:group_id])
    @message = Message.new(messages_params)
    if @message.save
      respond_to do |format|
        format.html {redirect_to group_messages_path(@group), notice: "メッセージが送信されました"}
        format.json
      end
    else
      flash.now[:alert] = "メッセージ投稿に失敗しました"
      render :index
    end
  end

  def destroy
    message = Message.find(params[:id])
    message.destroy if message.user_id == current_user.id
    redirect_to group_messages_path
  end

  private
  def messages_params
    params.require(:message).permit(:msg, :image).merge(user_id: current_user.id, group_id: params[:group_id])
  end
end
