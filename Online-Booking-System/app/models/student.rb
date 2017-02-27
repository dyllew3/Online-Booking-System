class Student < ActiveRecord::Base
  belongs_to :parent
  has_many :applications, dependent: :destroy
end
