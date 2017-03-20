class Lockout < ActiveRecord::Base
	def locked?
		self.locked
	end
end

