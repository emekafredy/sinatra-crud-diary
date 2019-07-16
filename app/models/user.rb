class User < ActiveRecord::Base
  validates_presence_of :name, :username, :email, :password, message: "is required"
  has_secure_password

	has_many :diaries
end
