class List < ActiveRecord::Base
  has_many :items

  validates :title, presence: true
  validates :title, length: {minimum: 3}
  validates :description, presence: true
end
