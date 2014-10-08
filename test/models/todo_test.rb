require 'test_helper'

class TodoTest < ActiveSupport::TestCase
  def check_field_is_required(field, valid_value)
    todo = Todo.new
    refute todo.valid?, "requires #{field}"
    refute todo.errors[field].empty?, "#{field} error should occur"

    todo.send("#{field}=", valid_value)
    todo.valid?
    assert todo.errors[field].empty?, "#{field} errors should be gone"
  end

  test "todo items are required" do
    check_field_is_required(:item, "Cheese")
  end

end
