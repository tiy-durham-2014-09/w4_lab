class Post < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	belongs_to :user
	# has_one :user_id
end
