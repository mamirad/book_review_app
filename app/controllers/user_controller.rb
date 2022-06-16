class UserController < ApplicationController
  before_action :user_signed_in?, only: [:following, :followers]
  def index
    @users = User.all.order("created_at DESC")
      
  end 

  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following
    render 'show_follow'
  end

  def followers
    # binding.pry
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follow'
  end

end
