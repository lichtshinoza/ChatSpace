class MessagesController < ApplicationController
  def index
    @groups = Group.all
  end
  def create
    @groups = Group.all
  end
end
