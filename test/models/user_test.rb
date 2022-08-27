require "test_helper"

class UserTest < ActiveSupport::TestCase


  test "should not follow" do
    
    user1 = User.first
    user2 = User.last
    assert_equal(user1.following?(user2), false)

  end
  
end
