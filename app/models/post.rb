class Post < ActiveRecord::Base
validates :title, presence: true
validates :body, presence: true
validates :author, presence: true
validates :published_date, presence: true

belongs_to :user
has_many :comments
end
