class Application < ActiveRecord::Base
  belongs_to :student
  belongs_to :activity
end
