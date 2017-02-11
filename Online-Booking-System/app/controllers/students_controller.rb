class StudentsController < ApplicationController
	def new
		@student = Student.new
	end
	def enroll
		@list = []
		@amount = User.find_by(id:session[:user_id]).amount
		@amount.times do
			@list  << Student.new

		end
		
	end	

end
