class UsersController < ApplicationController
	def new
		@user = User.new
		
		
	end

	def enroll
		

	current_user.students = []	

		if current_user 
		else
			redirect_to root_url
		end	
		 
	end
	
	def current_user
		User.find_by(id: session[:user_id])
	end
	

	def create
    	@user = User.new(user_params)
        if   @user.save

            flash[:danger] = nil
            session[:user_id] = @user.id
			redirect_to enroll_url
        else
            flash[:danger] = "Invalid entry into form!"
            redirect_to usersignup_url
        end
    end

	private
	def user_params
    	params.require(:user).permit(:first_name,:last_name,:email,:password,:password_confirmation,:amount)
    end




end
