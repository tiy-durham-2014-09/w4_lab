class Post < ActiveRecord::Base
  belongs_to :user, :foreign_key => :user_id
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :content, presence: true

end
