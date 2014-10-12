class Profile < ActiveRecord::Base
	include Gravtastic
	is_gravtastic :default => "identicons",
	              :size => 120
  belongs_to :user
end
