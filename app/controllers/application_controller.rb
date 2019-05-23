class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout proc { google_logged_in ? "google_logged_in" : "application" }
  before_action :authenticate_user!
  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden, content_type: 'text/html' }
      format.html { redirect_to root_url, notice: exception.message }
      format.js   { head :forbidden, content_type: 'text/html' }
    end
  end
  def index
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def is_user_logged_in?
	#complete this method
  	logged_in = current_user
	if logged_in then true else redirect_to root_path end 
  end

  def google_logged_in
    if session["warden.user.user.key"] then true else false end
  end
end
