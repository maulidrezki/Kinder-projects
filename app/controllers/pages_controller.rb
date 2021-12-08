class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    redirect_to projects_path if user_signed_in?

    if params[:query].present?
      @query = params[:query]
      @projects = Projectt.where("title iLike :query OR location iLike :query", query: "%#{params[:query]}%")
    else
      @projects = Project.all.first(5)
    end
  end

  def dashboard
    # My projects as a sponsor
    @my_projects = current_user.projects

    # My projects as a volunteer
    @volunteer_projects = current_user.volunteer_projects

    # My volunteers in a project, to review to accept or reject
    # @my_volunteers = Project.volunteering each do |volunteers|

  end
end
