class MessagesController < ApplicationController
  def index
    @project = Project.find(params[:project_id])
    @message = Message.new
  end

  def create
    @project = Project.find(params[:project_id])
    @message = Message.new(message_params)
    @message.project = @project
    @message.user = current_user
    if @message.save
      ProjectChannel.broadcast_to(
      @project,
      render_to_string(partial: "message", locals: { message: @message }))
      redirect_to project_messages_path(@project, anchor: "message-#{@message.id}")
    else
      render "pages/inbox"
    end
  end


  private

  def message_params
    params.require(:message).permit(:content,
                                    :photo)
  end
end
