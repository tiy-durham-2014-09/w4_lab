class List < ActiveRecord::Base
  has_many :items

  validates :title, presence: true
  validates :title, length: {minimum: 3}
  validates :description, presence: true

  def has_completed_items?
    items.complete.size > 0
  end

  def has_incomplete_items?
    items.incomplete.size > 0
  end
end
