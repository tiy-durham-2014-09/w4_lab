class Item < ActiveRecord::Base
  belongs_to :list

  validates :content, presence: true

  scope :complete, -> {where("completed_by is not null")}
  scope :incomplete, -> {where(completed_by: nil)}

  def completed?
    !completed_by.blank?
  end
end
