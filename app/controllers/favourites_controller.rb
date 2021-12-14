class FavouritesController < ApplicationController
  def create
    @project = Project.find(params[:project_id])

    current_user.favorite(@project)
    redirect_to request.referer
  end

  def destroy
    @project = Project.find(params[:project_id])

    current_user.unfavorite(@project)
    redirect_to request.referer
  end
end
