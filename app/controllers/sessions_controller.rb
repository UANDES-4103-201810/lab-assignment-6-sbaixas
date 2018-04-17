class SessionsController < ApplicationController
	def session_params
	    params.require(:session).permit(:email, :password)
	end	
	def new
	end

	def create
		if User.exists?(:email => session_params[:email])
			user = User.find_by_email(session_params[:email])
			if(user.password == session_params[:password])
				flash[:notice] = "Welcome!"
				session[:current_user_id] = user.id
				redirect_to :controller => 'users', :action => 'show', :id => user.id 
			else
				flash[:notice] = "Incorrect Credentials"
				redirect_to root_path
			end
		else
			flash[:notice] = "Incorrect Credentials"
			redirect_to root_path
		end
	end

	def destroy
		session[:current_user_id] = nil
	end
end
