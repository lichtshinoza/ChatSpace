class GroupsController < ApplicationController
  before_action :authenticate_user!, only: :index
  def index
  end

  def new
    @group = Group.new
  end

  def create
    # @group = Group.new(group_params)
    # binding.pry
    # @group.save
    @group = Group.create(group_params)
    if @group.members.present?
      redirect_to root_path, notice: "グループが作成されました。"
    else
      redirect_to new_group_path, alert: "入力は正しいですか？"
    end

  end

  def edit
  end

  def update
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
