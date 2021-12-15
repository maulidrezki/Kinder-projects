class ProjectsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :about]

  def index
    if params[:query].present?
      @query = params[:query]
      @projects = Project.where.not(status: "cancelled").where.not(status: "closed")
      @projects = @projects.where("title iLike :query OR location iLike :query OR description iLike :query", query: "%#{params[:query]}%")
    else
      @projects = Project.where.not(status: "cancelled").where.not(status: "closed")
    end
  end

  def show
    @project = Project.find(params[:id])
    @volunteering = Volunteering.new

    @my_volunteers = []
    @my_volunteers << { volunteers: @project.volunteerings, project: @project }

    @pending_volunteers = []
    @pending_volunteers << { volunteers: @project.volunteerings.where(status: "pending"), project: @project }


    @confirmed_volunteers = []
    @confirmed_volunteers << { volunteers: @project.volunteerings.where(status: "confirmed"), project: @project }

    @rejected_volunteers = []
    @rejected_volunteers << { volunteers: @project.volunteerings.where(status: "rejected"), project: @project }
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
    previous_dates = [@project.start_date, @project.end_date, @project.start_time, @project.end_time]
    @project.update(project_params)
    changed_dates = [@project.start_date, @project.end_date, @project.start_time, @project.end_time]
    if @project.status == "closed"
      @project.volunteerings.where(status: "confirmed").each do |volunteer|
        volunteer.user.update(level: volunteer.user.level + 5)
      end
      @project.user.update(level: current_user.level + 10)
    elsif @project.status == "cancelled"
      Message.create!(
        user: @project.user,
        project: @project,
        content: "Sorry, your project was cancelled."
      )

      ProjectChannel.broadcast_to(
        @project,
        render_to_string(partial: "messages/last_message", locals: { project: @project })
      )
    elsif !(previous_dates - changed_dates).empty?
      Message.create!(
        user: @project.user,
        project: @project,
        content: "Your project date/time changed."
      )

      ProjectChannel.broadcast_to(
        @project,
        render_to_string(partial: "messages/last_message", locals: { project: @project })
      )
    end
    redirect_to project_path(@project)
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to dashboard_path
  end


  def about; end

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
