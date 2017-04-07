class SessionsController < ApplicationController

	include SessionsHelper

	def new
	redirect_to root_url unless session[:user_id] == nil	
	end
	

	def create
		user = User.find_by(email: params[:session][:email])
		if user && user.authenticate(params[:session][:password] ) && user.authenticated? && !lock(user.id)
			log_in(user)
			redirect_to root_url
			session[:user_id] = user.id
			else
			lock(user.id)
			flash[:message] = "Not valid combination of email and password" unless lock(user.id)
			flash[:message] = "You have locked out for an hour" if lock(user.id)
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
	
#checks if user is locked they have 3 attempts to login if they fail 3
#times then they have to wait an hour to login
def lock(usr_id)
	@lock = Lockout.find_by(user_id:usr_id)
	if @lock.nil?
	@lock = Lockout.new
	value = 0
	@lock = Lockout.create(count:0,user_id:usr_id)
	@lock.update(count:value)
	@lock.save
	 
	elsif @lock.count >= 3
		if  time_dif(@lock.updated_at)
			value = 0
			@lock.update(count:value)
			@lock.save
		else
			return true
		end
	else
		cur_count = @lock.count + 1
		@lock.update(count:cur_count)
	end
	return false
	end
	
	def time_dif(date)
		Time.now - date.to_time >= 1.hours
	end
end
