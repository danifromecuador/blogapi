class Post < ApplicationRecord
  belongs_to :user

  validates_presence_of :user_id, :title, :content, :published
end
