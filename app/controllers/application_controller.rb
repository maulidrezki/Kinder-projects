class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :expired_projects

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :display_name, :avatar, :about_me])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :display_name, :avatar, :about_me])

  end

  def destroy_user_session_path
    redirect_to root
  end

  def expired_projects
    Project.where("end_date < ?", Date.today).update_all(status: "closed")
  end

  def user_root_path
    dashboard_url
  end
end
