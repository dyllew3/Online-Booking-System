class SessionsController < ApplicationController

	include SessionsHelper

	def new
	end
	

	def create
		user = User.find_by(email: params[:session][:email])
		log_in(user)	
	end
	
	def destroy
          
	  log_out
	  redirect_to root_url	
	end

end
