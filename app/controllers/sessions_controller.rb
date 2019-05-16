class SessionsController < ApplicationController
	def new
	end

	def create
		#complete this method
	end

	def destroy
		cookies[user_id] = ""
		redirect_to root_path

		#complete this method
	end
end
