class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @total_listed_projects = @user.projects.length
    @total_volunteered = @user.volunteerings.length
    @my_last_project = @user.projects.last
    @my_last_volunteer = @user.volunteerings.last
  end
end
