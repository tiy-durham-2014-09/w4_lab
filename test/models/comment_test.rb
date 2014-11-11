require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  should validate_presence_of(:user)
  should validate_presence_of(:body)
end
