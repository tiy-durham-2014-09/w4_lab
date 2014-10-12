class Post < ActiveRecord::Base
  belongs_to :user

  validates :message, presence: true, length: { maximum: 141 }

  def to_s
    message
  end

	

end
