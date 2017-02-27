class Application < ActiveRecord::Base
  has_one :student
  has_one :activity
end
