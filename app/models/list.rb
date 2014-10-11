class List < ActiveRecord::Base
  has_many :todos, :through users
end
