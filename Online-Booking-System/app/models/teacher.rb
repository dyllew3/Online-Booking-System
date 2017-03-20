class Teacher < ActiveRecord::Base
	
	#has_many :subjects,dependent: :destroy
	has_one :user, as: :userable,dependent: :destroy
	accepts_nested_attributes_for :user
	#accepts_nested_attributes_for :subjects
	validates :user,presence: true
	validates :subjects,presence: true
end
