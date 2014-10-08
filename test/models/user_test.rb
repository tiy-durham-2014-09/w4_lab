require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def check_field_is_required(field, valid_value)
    user = User.new
    refute user.valid?, "requires #{field}"
    refute user.errors[field].empty?, "#{field} error should occur"

    user.send("#{field}=", valid_value)
    user.valid?
    assert user.errors[field].empty?, "#{field} errors should be gone"
  end


  test "users names are required" do
    check_field_is_required(:name, "Vance")
  end

  test "users emails are required" do
    check_field_is_required(:email, "vpfaulkner@gmail.com")
  end

  test "users passwords are required" do
    check_field_is_required(:password, "password")
  end

  test "users emails must be unique" do
    existing_user = users(:one)

    new_user = User.new(name: "Alan",
                        email: existing_user.email,
                        password: "mypassword")

    refute new_user.valid?
    refute new_user.errors[:email].empty?, "email must be unique"
    end

end
