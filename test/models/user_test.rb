require "test_helper"

class UserTest < ActiveSupport::TestCase

  # test "should  return true  " do
  #   binding.pry
  #   user = User.new
  #   user.email = "hamza7@gmail.com"
  #   # user.encrypted_password = "password"
  #   user.user_name = "hamza7"
  #   assert user.save ,"Insertion Done"
  # end
  test "should follow" do 
    
    user1 = User.first
    user2 = User.last

    assert_difference("Relationship.count") do
      user1.follow(user2)
    end
  
  end

  # test "should unfollow" do 
    
  #   user1 = User.first
  #   user2 = User.last

  #   assert_difference("Relationship.count", -1) do
  #     user1.unfollow(user2)
  #   end
  
  # end
  
end
