class GroupsController < ApplicationController
  before_action :authenticate_user!, only: :index
  def index
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  private
  def move_to_index
      redirect_to action: :index unless user_signed_in?
      # indexアクションを強制的に実行する
  end
end
