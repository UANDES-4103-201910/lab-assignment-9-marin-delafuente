class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def index

  end

  def current_user
    @current_user ||= session[:current_user_id] && User.find_by_id(session[:current_user_id])
  end

  def is_user_logged_in?
	#complete this method
  logged_in = false
  if cookies["user_id"] != ""
    logged_in = true
  end
  if self.current_user
    logged_in = true
  end



	if logged_in then true else redirect_to home_path end
  end

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || root_path
  end
end
