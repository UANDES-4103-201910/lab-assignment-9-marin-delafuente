class RegistrationsController < ApplicationController
	def new
	
	end

	def create
	    #complete this method
			r = params[:registrations]
			@user = User.create(name: r[:name],last_name: r[:last_name], email:r[:email],phone:r[:phone],
													encrypted_password:r[:encrypted_password])
			if @user.save
				respond_to do |format|
					format.html { redirect_to root_path, notice: 'User was successfully created.' }
				end
			else
				flash[:alert] = "couldn't create the user"
			end
	end



end
