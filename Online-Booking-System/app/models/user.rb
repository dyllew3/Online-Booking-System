class User < ActiveRecord::Base
	has_secure_password
	belongs_to :userable,polymorphic:true
	validates :password,presence: true,confirmation:true,length: { minimum: 10}
	validates :email, presence: true,uniqueness: true
end
