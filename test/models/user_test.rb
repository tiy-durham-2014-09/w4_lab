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

  test "name is required" do
    check_field_is_required(:name, "Aubrey")
  end

  test "email is required" do
    check_field_is_required(:email, "aubrey@gmail.com")
  end

  test "password is required on create" do
    check_field_is_required(:password, "donkey teeth")
  end

  test "email must be unique" do
    existing_user = users(:one)

    new_user = User.new(name: "Bojangles",
                        email: existing_user.email,
                        password: "password")

    refute new_user.valid?
    refute new_user.errors[:email].empty?, "email must be unique"
  end
end