class Subject < ActiveRecord::Base
    has_many :students
    belongs_to :teacher
    validates :capacity,presence:true
    validates :teacher,presence:true
    validates :subject,presence:true
    
end
