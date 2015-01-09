class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  delegate :title, :to => :post, :prefix => true

  validates :body, presence: true
  validates :commenter, presence: true
end
