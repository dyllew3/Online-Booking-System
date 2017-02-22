class UsersController < ApplicationController

	def create
			
		@user = User.new(user_params)
		@user.save
	end
	
	def new

	

	end
	def user_params

	     params.require(:user).permit(:first_name,:last_name,:email,:password,:passowrd_confirmation,:admin)

	end
	
end
