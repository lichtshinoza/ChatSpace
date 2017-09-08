class UsersController < ApplicationController
  before_action :authenticate_user!, only: :show
  def new
  end

  def create
  end

  def edit
  end

  def update
  end

end
