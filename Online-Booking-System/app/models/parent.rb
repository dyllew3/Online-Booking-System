class Parent < ActiveRecord::Base
	has_one :user,as: :userable,dependent: :destroy
	has_many :students,dependent: :destroy
	accepts_nested_attributes_for :user
	accepts_nested_attributes_for :students,reject_if: proc { |attributes| attributes['first_name'].nil? }
	validates :user,presence: true
        validates :students,presence: true
end
