class LockedOut < ActiveRecord::Base
	def lock_out(user_id):
		@lock = LockedOut.new(used_id:user_id,time_of:date)
		if(@lock.save)
			redirect_to root_url
		end
	end


end
