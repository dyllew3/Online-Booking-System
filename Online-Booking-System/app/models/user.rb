class User < ActiveRecord::Base
	has_secure_password
	validates :password, :presence => true,:confirmation => true,:length => {:within => 6..40},:on => :create
     validates :password, :confirmation => true,:length => {:within => 6..40},:allow_blank => true,:on => :update
    validates :email, uniqueness: true
   	has_many :students, :dependent => :destroy
	accepts_nested_attributes_for :students, reject_if: lambda {|attributes|attributes['kind'].blank? }  
   
end
