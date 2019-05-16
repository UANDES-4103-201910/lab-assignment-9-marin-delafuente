class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index

  end

  def current_user
    @user = User.find(cookies["user_id"].to_i)
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



	if logged_in then true else redirect_to root_path end 
  end

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || root_path
  end
end
