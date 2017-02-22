class Student < ActiveRecord::Base
  belongs_to :parent
  belongs_to :subject
end
