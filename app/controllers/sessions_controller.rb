class SessionsController < ApplicationController
	def new
	end

	def create
		#complete this method
		user = User.where(email: user_params[:email]).first
		puts("###############")
		puts user
		puts session[:current_user_id]
		puts("###############")
		if user && user.encrypted_password == user_params[:password]
			# Save the user ID in the session so it can be used in
			# subsequent requests
			session[:current_user_id] = user.id
			flash[:notice] = "Welcome!"
			redirect_to home_path
		else
			flash[:error] = "Incorrect username or password!"
			redirect_to root_url
		end

	end

	def destroy
		@current_user = session[:current_user_id] = nil
		#self.current_user = ""
		#cookies[user_id] = ""
		redirect_to root_path

		#complete this method
	end

	def user_params
		params.require(:session).permit(:email, :password)
	end

	protected

	def auth_hash
		request.env['omniauth.auth']
	end
end
