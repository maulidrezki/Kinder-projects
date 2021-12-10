class ProjectsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query].present?
      @query = params[:query]
      @projects = Project.where("title iLike :query OR location iLike :query OR description iLike :query", query: "%#{params[:query]}%")
    else
      @projects = Project.all
    end
  end

  def show
    @project = Project.find(params[:id])
    @volunteering = Volunteering.new
    @my_volunteers = []
    @my_volunteers << { volunteers: @project.volunteerings, project: @project }
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.status = "open"
    @project.user = current_user
    if @project.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    @project.update(project_params)
    redirect_to project_path(@project)
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to dashboard_path
  end


  private

  def project_params
    params.require(:project).permit(:title,
                                    :location,
                                    :description,
                                    :contact,
                                    :status,
                                    :instagram_link,
                                    :facebook_link,
                                    :website_link,
                                    :linkedin_link,
                                    :start_date,
                                    :end_date,
                                    :start_time,
                                    :end_time,
                                    :photos)
  end
end
