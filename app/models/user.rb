class User < ApplicationRecord
  has_secure_password
  has_many :ideas
  validates_presence_of :username, :password
  validates_uniqueness_of :username
  enum role: ["default", "admin"]
end
