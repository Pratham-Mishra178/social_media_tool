class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one_attached :video
  validates :content, presence: true
  validates :scheduled_at, presence: true
  validates :title, :content, :post_type, :schedule_date, :schedule_time, presence: true
end
