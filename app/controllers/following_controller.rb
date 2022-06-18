class FollowingController < ApplicationController

  def index
    @title = "Following"
    @user  = current_user
    @users = @user.following
    render 'home/show_follow'
  end
end
