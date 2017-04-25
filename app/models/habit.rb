class Habit < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true
  #description

  belongs_to :user
  has_many :activity_logs

  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods

end
