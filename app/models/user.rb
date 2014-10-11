class User < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  has_secure_password

  has_many :post
  has_many :comments

  def to_s
    name
  end
end
