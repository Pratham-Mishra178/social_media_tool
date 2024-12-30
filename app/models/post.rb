class Post < ApplicationRecord
  belongs_to :user
  
  validates :content, presence: true
  validates :scheduled_at, presence: true
end
