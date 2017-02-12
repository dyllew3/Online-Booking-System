class SessionsController < ApplicationController
	
	def new
	end
	
	def create
		user = User.find_by(email: params[:session][:email])
    	if user && user.authenticate(params[:session][:password])
			session[:user_id] = user.id
			format.html { redirect_to user, notice: 'Successful login' }
        format.json { render :show, status: :created, location: user }
	
      # Log the user in and redirect to the user's show page.
    	else
      		flash[:danger] = 'Invalid email/password combination' # Not quite right!
     		render 'new'
    	end
	end
	
	def destroy
	    log_out	
		redirect_to root_url
	end
	private
	def log_in(user)
        session[:user_id] = user.id
    end

    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end

  # Returns true if the user is logged in, false otherwise.
    def logged_in?
        !current_user.nil?
    end


  # Logs out the current user.
    def log_out
        session.delete(:user_id)
        @current_user = nil
    end

end
