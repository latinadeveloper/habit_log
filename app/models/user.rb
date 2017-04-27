class User < ActiveRecord::Base
  validates :username, presence: true, length: { minimum: 5 }
  validates :email,  presence: true, length: { minimum: 5 }, format: { :with => /@/, message: "invalid email"}
  has_secure_password

  has_many :habits

  # extend Slugifiable::ClassMethods
  # include Slugifiable::InstanceMethods

end
