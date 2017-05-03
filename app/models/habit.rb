class Habit < ActiveRecord::Base
  validates :title, presence: true, length: { minimum: 2 }
  validates :description, presence: true, length: { minimum: 2 }

  belongs_to :user
  has_many :activity_logs
end
