class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    # redirect_to projects_path if user_signed_in?

    if params[:query].present?
      @query = params[:query]
      @projects = Project.where("title iLike :query OR location iLike :query", query: "%#{params[:query]}%")
    else
      @projects = Project.all.first(5)
    end
  end

  def dashboard
    # My projects as a sponsor
    @my_projects = current_user.projects.where(status: "open")
    @my_past_projects = current_user.projects.where(status: ["closed", "cancelled"])

    # My projects as a volunteer
    @volunteer_projects = current_user.volunteer_projects.where(status: "open")
    @my_volunteer_past_projects = current_user.volunteer_projects.where(status: ["closed", "cancelled"])

    # My volunteers in a project, to review to accept or reject
    # @my_volunteers = Project.volunteering each do |volunteers|
    @my_volunteers = []
    @my_projects.each do |project|
      @my_volunteers << { volunteers: project.volunteerings, project: project }
    end
  end

  def profile
    @user = current_user
    @query = @user.id
    @listed = []
    @listed += Project.where("user_id = :query", query: @query)
    @total_listed_projects = @listed.size
    @volunteered = []
    @volunteered += Volunteering.where("user_id = :query", query: @query)
    @total_volunteered = @volunteered.size
  end

end
