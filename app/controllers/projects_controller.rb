class ProjectsController < ApplicationController

  def show
    @project = Project.find(params[:id])
    @volunteer = Volunteer.new
  end
end
