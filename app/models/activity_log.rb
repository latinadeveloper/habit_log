class ActivityLog < ActiveRecord::Base
  validates :date, presence: true
  belongs_to :habit  
end
