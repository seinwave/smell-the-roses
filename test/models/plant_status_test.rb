require "test_helper"

class StatusTest < ActiveSupport::TestCase
  test "should not save a status without a status entry" do
    status = Status.new
    assert_not status.save
  end
end
