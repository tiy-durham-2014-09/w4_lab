class Post < ActiveRecord::Base
validates :title, presence: true
validates :body, presence: true
validates :published_date, presence: true
# has_one :user_id
belongs_to :user
has_many :comments
end
