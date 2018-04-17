class RegistrationsController < ApplicationController

	def registration_params
	    params.require(:registrations).permit(:name, :last_name, :email, :password, :phone)
	end	
	def new
		
	end

	def create 
		user = User.create(registration_params)
	    	if user.valid? 
			flash[:notice] = "Registration Complete"
	    		redirect_to root_path
		else
			flash[:notice] = user.errors.messages
			redirect_to "/sign_in"		
		end
	end
end
