class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :body, presence: true
  validates :published_data, presence: true

  belongs_to :user
  has_many :comments
end
