class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

   def dashboard
    # My projects as sponsor
    @my_projects = current_user.projects

    # My projects as volunteer
    @volunteer_projects = current_user.volunteer_projects
  end
end
