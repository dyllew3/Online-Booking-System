class Parent < ActiveRecord::Base
	has_one :user,as: :userable,dependent: :destroy
	has_many :students,dependent: :destroy
	accepts_nested_attributes_for :user
	accepts_nested_attributes_for :students
	
end
