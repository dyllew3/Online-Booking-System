class WelcomeController < ApplicationController
	 
	def index
	end
	def new
		
	   @user = User.find_by(id:session[:user_id])
	   if @user == nil
		redirect_to login_url
	   elsif @user.authenicated
				
        else
		redirect_to root_url
	   end

	end
	def add_admin
		if params["admins"] != nil 
			@emails = params["admins"].keys
	   		#flash[:notice] = params["approved"].keys
	   		@emails.each do |u|
			
				@user = User.find_by(email: u)
				@user.up_admin unless params["admins"][u.to_s].to_i == 0 
							
			end 
		end
		redirect_to '/admins/add' 
	end
	
	def approve
	   @test = Parent.new
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
	
	def non_admin
		@all = User.all
	    @result = []
	    @all.each do |u|
			if !u.admin?
		   		@result << u
			end		
	    end
        return @result

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
	helper_method :not_authenticated, :non_admin
end
