class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index

  end

  def current_user

	#complete this method
  end

  def is_user_logged_in?
	#complete this method
  if cookies[user_id] == ""
    logged_in = false
  end

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || root_path
  end

	if logged_in then true else redirect_to root_path end 
  end
end
