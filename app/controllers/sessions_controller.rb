class SessionsController < ApplicationController
	def new
	end

	def create
		#complete this method
		@user = User.where(email: params[:session][:email]) #User.find_or_create_from_auth_hash(auth_hash)
		if @user != nil
			if @user.encypted_password == params[:session][:password]
				self.current_user = @user
				redirect_to '/aplications/index'
			end
		end

			flash[alert] ="error"

	end

	def destroy
		self.current_user = ""
		cookies[user_id] = ""
		redirect_to root_path

		#complete this method
	end

	protected

	def auth_hash
		request.env['omniauth.auth']
	end
end
