class User < ActiveRecord::Base
	has_secure_password
	has_many :students
	validates :password, :presence => true,:confirmation => true,:length => {:within => 6..40},:on => :create
	 validates :password, :confirmation => true,:length => {:within => 6..40},:allow_blank => true,:on => :update
	validates :email, uniqueness: true
	validates :amount, :numericality => { :greater_than_or_equal_to => 1 }	
	
	accepts_nested_attributes_for :students
		
	def admin?
		self.admin
	end

end
