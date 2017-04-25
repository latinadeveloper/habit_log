class ActivityLog < ActiveRecord::Base
#daily commnent
#daily thought
validates :date, presence: true

belongs_to :habit
  
end
