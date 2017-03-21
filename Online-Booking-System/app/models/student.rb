class Student < ActiveRecord::Base
  belongs_to :parent
  has_one :StudentClass
  has_many :applications, dependent: :destroy
  
  
  def first_last_name
		"#{first_name} #{last_name}"
	end
end
