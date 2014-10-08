require 'test_helper'

class ListTest < ActiveSupport::TestCase
  def check_field_is_required(field, valid_value)
    list = List.new
    refute list.valid?, "requires #{field}"
    refute list.errors[field].empty?, "#{field} error should occur"

    list.send("#{field}=", valid_value)
    list.valid?
    assert list.errors[field].empty?, "#{field} errors should be gone"
  end

  test "list titles are required" do
    check_field_is_required(:title, "Groccery")
  end

end
