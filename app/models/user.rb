class User < ApplicationRecord
  has_many :posts

  validates_presence_of :name, :email, :auth_token
  validates_uniqueness_of :name, :email
end
