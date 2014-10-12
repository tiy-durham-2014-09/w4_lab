class User < ActiveRecord::Base
	include Gravtastic
		is_gravtastic :default => "identicons",
		              :size => 120


  has_many :posts, dependent: :destroy
  has_one :profile, dependent: :destroy

  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed

  has_many :reverse_relationships, foreign_key: "followed_id",
           class_name:  "Relationship",
           dependent:   :destroy
  has_many :followers, through: :reverse_relationships, source: :follower

  validates :name, presence: true
  validates :handle, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  has_secure_password



	def to_s
		"@" + handle
  end

  def following?(other_user)
	  relationships.find_by(followed_id: other_user.id)
  end

  def follow!(other_user)
	  relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
	  relationships.find_by(followed_id: other_user.id).destroy
  end



  def paginate(options)
	  # code here
  end

end
