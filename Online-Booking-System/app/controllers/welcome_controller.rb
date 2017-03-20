class WelcomeController < ApplicationController

	def index
	end
	def approve
	   @users = []
	   @user = User.find_by(id:session[:user_id])
	   if @user == nil
		redirect_to login_url
	   elsif @user.authenticated?
			@users = not_authenticated	
           else
		redirect_to root_url
	   end

	end
	def not_authenticated
	    @all = User.all
	    @result = []
	    @all.each do |u|
		if !u.authenticated?
		   @result << u
		end		
	    end
            return @result
	end
end
