require "test_helper"

class RelationshipsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    get '/users/sign_in'
    sign_in users(:one)
    post user_session_url
  end

  test "should follow user and create relation" do
    post relationships_url , params: { follower_id: users(:one).id , followed_id: users(:two).id  }
    assert users(:one).active_relationships, 1
  end
end
