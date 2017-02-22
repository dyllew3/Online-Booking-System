class Teacher < ActiveRecord::Base
	
	has_many :subjects,dependent: :destroy
	has_one :user, as: :userable,dependent: :destroy
	accepts_nested_attributes_for :user
	accepts_nested_attributes_for :subjects
end
