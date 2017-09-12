class GroupsController < ApplicationController
  before_action :authenticate_user!, only: :index
  def index
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.create(group_params)
    # binding.pry
    # if @group.save
    #   redirect_to root_path
    # else
    #   render :new
    # end
    # Group.create(group_params)
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
