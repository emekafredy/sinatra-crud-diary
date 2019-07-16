class User < ActiveRecord::Base
  validates_presence_of :username, :email, :password, message: "is required"
  has_secure_password

	has_many :diaries
end
