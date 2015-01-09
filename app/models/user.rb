class User < ActiveRecord::Base
  attr_accessor :avatar
  before_save { self.email = email.downcase }

  has_many :posts
  has_many :comments, through: :posts
  has_attached_file :avatar,
                    :default_url => "/images/:style/missing.png",
                    :styles => { :medium => "300x300>",
                                 :thumb => "75x75>" }

  validates :name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
  uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 5 }
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  has_secure_password

  def to_s
    name
  end
end
