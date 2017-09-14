class GroupsController < ApplicationController
  before_action :authenticate_user!, only: :index

  def index
    @groups = current_user.groups
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to root_path, notice: "グループが作成されました。"
    else
      render new_group_path
    end
  end

  def edit
    @group = Group.new
    @group_name = Group.find(params[:id]).name
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to root_path, notice: "グループ名を変更しました：更新成功！"
    else
      redirect_to edit_group_path(params[:id]), alert: "グループ名を入れてください：請輸入組名！"
    end
  end

  private
  def group_params
      params.require(:group).permit(:name, user_ids: [])
  end

  def move_to_index
      redirect_to action: :index unless user_signed_in?
      # indexアクションを強制的に実行する
  end
end
