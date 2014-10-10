class User < ActiveRecord::Base
  has_many :posts
  has_one :profile

  # Self join fans and idols
  has_many :fans, class_name: "User", foreign_key: "idol_id"
  belongs_to :idol, class_name: "User"
  ###

  validates :name, presence: true
  validates :handle, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  has_secure_password

	def to_s
		handle
	end
end
