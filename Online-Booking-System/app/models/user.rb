class User < ActiveRecord::Base
	attr_accessor :remember_token
	has_secure_password
	belongs_to :userable,polymorphic:true
	validates :password,presence: true,confirmation:true,length: { minimum: 6}
	validates :email, presence: true,uniqueness: true

	def self.digest(string)
		cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
		BCrypt::Password.create(string, cost: cost)
	end

# Returns a random token.
	def self.new_token
		SecureRandom.urlsafe_base64
	end

# Remembers a user in the database for use in persistent sessions.
	def remember
		self.remember_token = User.new_token
		update_attribute(:remember_digest, User.digest(remember_token))
	end
    def admin?
          self.admin
        end
        def authenticated?
          self.authenicated
        end

        def locked?
          
          return false
        end

end
