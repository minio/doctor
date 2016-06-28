class User < ActiveRecord::Base
  has_secure_password
  validates_uniqueness_of :email
  validates :email, presence: true
end
