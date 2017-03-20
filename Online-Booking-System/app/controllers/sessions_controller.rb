class SessionsController < ApplicationController

	include SessionsHelper

	def new
	redirect_to root_url unless session[:user_id] == nil	
	end
	

	def create
		user = User.find_by(email: params[:session][:email])
		if user && user.authenticate(params[:session][:password] ) && user.authenticated?
			log_in(user)
			redirect_to root_url
			session[:user_id] = user.id
			else
			flash[:message] = "Not valid combination of email and password"
			redirect_to login_url	

					end	
	end
	
	def homepage
		@current_user = User.find_by(id:session[:user_id]) || 0
		if @current_user == 0
			redirect_to login_url
		elsif @current_user.authenicated
			redirect_to (@current_user.userable_type.to_s + "/" + @current_user.userable_id.to_s)
		else
			
		end
	end
		
	def destroy
          
	  log_out
	  redirect_to root_url	
	end
	def homepage
	end

end
