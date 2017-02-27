class Activity < ActiveRecord::Base
	has_one :teacher
	has_many :activity_dates, dependent: :destroy
	has_many :applications, dependent: :destroy
end
