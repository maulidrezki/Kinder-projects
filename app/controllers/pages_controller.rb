class PagesController < ApplicationController

  def home
    if user_signed_in?
      redirect_to root_path
    end

    if params[:query].present?
      @query = params[:query]
      @projects = Projectt.where("title iLike :query OR location iLike :query", query: "%#{params[:query]}%")
    else
      @projects = Project.all.first(5)
    end
  end

  def dashboard
    # My projects as sponsor
    @my_projects = current_user.projects

    # My projects as volunteer
    @volunteer_projects = current_user.volunteer_projects
  end
end
