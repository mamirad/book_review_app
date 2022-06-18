class FollowersController < ApplicationController
  
  def index
    @title = "Followers"
    @user  = current_user
    @users = @user.followers
    render 'home/show_follow'
  end
end
