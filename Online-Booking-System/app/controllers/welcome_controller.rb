class WelcomeController < ApplicationController
	 
	def index
	end
	def new
		#standard checking for authentication
		@user = User.find_by(id:session[:user_id])
		if @user.nil?
			redirect_to login_url
		elsif @user.authenticated? and @user.admin? 
			
		else
			redirect_to @user
		end
	end

	def create_admin
		if params["admins"] != nil 
			@emails = params["admins"].keys
	   		
	   		@emails.each do |u|
			
				@user = User.find_by(email: u)
				@user.make_admin unless params["admins"][u.to_s].to_i == 0 
							
			end 
		end
		redirect_to admins_add_url
			
	end
	
	def approve
	   
	   @users = []
	   @user = User.find_by(id:session[:user_id])
	   if @user == nil
		redirect_to login_url
	   elsif @user.authenicated
				
        else
		redirect_to root_url
	   end

	end
	def authen
		if params["approved"] != nil 
			@emails = params["approved"].keys
	   		#flash[:notice] = params["approved"].keys
	   		@emails.each do |u|
			
				@user = User.find_by(email: u)
				@user.approve unless params["approved"][u.to_s].to_i == 0 
							
			end 
		end
		redirect_to approve_url
	end
private 	
	def non_admins
		@all = User.all
	    @result = []
	    @all.each do |u|
			if !u.admin?
		   		@result << u
			end		
	    end
        return @result

	end
	helper_method :non_admins
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
	helper_method :not_authenticated
end
