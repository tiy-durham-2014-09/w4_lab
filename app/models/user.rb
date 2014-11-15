class User < ActiveRecord::Base
validates :name, presence: true
validates :email, presence: true, uniqueness: true

  has_many :posts
  has_many :comments

has_secure_password

  def to_s
    name
  end
end
