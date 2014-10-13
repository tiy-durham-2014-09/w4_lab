class Todo < ActiveRecord::Base
  belongs_to :list
  belongs_to :user

  validates :name, presence: true

  def days_remaining
    unless self.due_date == nil
      remaining = (self.due_date - Date.today)
      remaining.to_i
    end
  end
end
