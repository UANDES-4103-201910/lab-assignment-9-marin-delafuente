class SessionsController < ApplicationController
	def new
	end

	def create
		#complete this method
		@user = User.find_or_create_from_auth_hash(auth_hash)
		self.current_user = @user
		redirect_to '/'
	end

	def destroy
		cookies[user_id] = ""
		redirect_to root_path

		#complete this method
	end

	protected

	def auth_hash
		request.env['omniauth.auth']
	end
end
