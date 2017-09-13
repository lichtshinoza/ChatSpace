class GroupsController < ApplicationController
  before_action :authenticate_user!, only: :index

  def index
    @groups = Group.all
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
  end

  def update
    @group = Group.new(group_params)
    if @group.save
      redirect_to root_path, notice: "グループ情報が更新されました。"
    else
      render edit_group_path
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
