class SessionsController < ApplicationController

	include SessionsHelper

	def new
		if session[:login_count] == nil
			session[:login_count] = 0
		end
	end
	

	def create
		user = User.find_by(email: params[:session][:email])
		if user == nil
			session[:login_count] += 1
			flash[:message] = "Not valid combination of email and password"
			redirect_to login_url	
		else
			log_in(user)
		end	
	end
	
	def destroy
          
	  log_out
	  redirect_to root_url	
	end

end
