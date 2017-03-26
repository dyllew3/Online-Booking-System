class Application < ActiveRecord::Base
  belongs_to :student
  has_one :activity
end
