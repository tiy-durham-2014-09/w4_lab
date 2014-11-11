class Comment < ActiveRecord::Base
  belongs_to :posts

  validates :user, presence: true
  validates :body, presence: true
end
