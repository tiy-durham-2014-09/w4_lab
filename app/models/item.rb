class Item < ActiveRecord::Base
  belongs_to :list

  validates :content, presence: true

  def completed?
    !completed_by.blank?
  end
end
