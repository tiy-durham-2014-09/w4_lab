class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :password, :on => :create
  has_many :todos

   def to_s
    name
  end
end
