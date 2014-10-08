class User < ActiveRecord::Base
  has_many :lists
  has_many :todos, through: :lists

  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true
end
