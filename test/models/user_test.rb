require 'test_helper'

class UserTest < ActiveSupport::TestCase
	require 'spec_helper'

	describe User do
		it { should respond_to(:posts) }
		it { should respond_to(:relationships) }
	end
end
