class List < ActiveRecord::Base
  belongs_to :user
  has_many :todos

  validates :title, presence: true

  def to_s
    title
  end

end
