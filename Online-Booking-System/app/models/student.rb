class Student < ActiveRecord::Base
  belongs_to :parent
  belongs_to :StudentClass, :foreign_key => 'year'
  has_many :applications, dependent: :destroy
  
  
  def first_last_name
		"#{first_name} #{last_name}"
	end
end
