require "test_helper"

class RelationshipTest < ActiveSupport::TestCase
  test "Return True" do
    ra =  Relationship.new
    ra.follower_id = 980190962
    ra.followed_id = 298486374

    assert ra.save , "true"
  end

  test "Follower ID Required " do
    ra =  Relationship.new
    ra.followed_id = 298486374
    assert_not ra.save , "follower id require"
  end

  test "Followed ID Required " do
    ra =  Relationship.new
    ra.follower_id = 980190962
    assert_not ra.save , "followed id required"
  end
end
