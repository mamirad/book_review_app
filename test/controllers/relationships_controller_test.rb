require "test_helper"

class RelationshipsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    get '/users/sign_in'
    sign_in users(:one)
    post user_session_url
  end

  test "should follow user and create relation" do 
    user2 = User.last
    
    assert_difference("Relationship.count") do
      post relationships_url , params: { relationship: { follower_id: users(:one) , followed_id: user2 } }
    end
  
    
  end
end
