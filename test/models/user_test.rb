require 'test_helper'

class UserTest < ActiveSupport::TestCase
	require 'spec_helper'

	describe User do
		it { should respond_to(:posts) }
		it { should respond_to(:relationships) }
    it { should respond_to(:followed_users) }
    it { should respond_to(:reverse_relationships) }
    it { should respond_to(:followers) }


    describe "following" do

      it { should be_following(other_user) }
      its(:followed_users) { should include(other_user) }

      describe "followed user" do
        subject { other_user }
        its(:followers) { should include(@user) }

      end

    end
	end
end
