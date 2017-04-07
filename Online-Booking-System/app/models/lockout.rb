class Lockout < ActiveRecord::Base
	def	lock(usr_id)
		@lock = Lockout.find_by(user_id:usr_id)
		if !@lock.nil?
			cur_count = @lock.count
			cur_count += 1
			cur_count
			@lock.update(count:cur_count)
			@lock.save
			
		else
			@lock = Lockout.new
			@lock = Lockout.create(user_id:usr_id)
			@lock.save	
		end	

	end
	
	def self.locked?
		self.count == 3
	end
	def time_dif(date)
		Time.now - date.to_time

	end

	end

