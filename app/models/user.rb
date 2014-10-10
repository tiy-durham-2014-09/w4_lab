class User < ActiveRecord::Base
  # attr_accessor :name, :email, :password, :password_confirmation
  #
  # attr_accessor :password
  # before_save :encrpyt_password
  validates :name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
  uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 5 }

  has_secure_password

  has_many :posts

  def to_s
    name
  end

  # def authenticate
  #   current_user_id = session[:current_user_id]
  #   unless current_user_id
  #     redirect_to new_login_path, notice: "You must be logged in to see this."
  #   end
  # end
end
