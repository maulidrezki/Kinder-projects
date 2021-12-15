class InboxsController < ApplicationController
  def show
    @inbox = Chatroom.find(params[:id])
  end
end
