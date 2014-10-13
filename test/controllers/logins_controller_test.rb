require 'test_helper'

class LoginsControllerTest < ActionController::TestCase
  test "create new login page" do
    get :create
    assert_response :success
  end
end
