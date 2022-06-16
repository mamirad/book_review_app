class HomeController < ApplicationController
  before_action :user_signed_in?, only: [:following, :followers]

  def index
    @current_user = current_user
    if @current_user
      # binding.pry
      @users = User.all.where.not(id: @current_user.id)
    else
      render 'home/index'
    end
    
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
  # def after_sign_in_path_for(resource)
  #   # binding.pry
  #   # if session.destroy
  #   #   users = User.all
  #   # else
  #   #   session.start
  #   #   users = User.all.where.not(id: current_user.id)
  #   # end
  #   user_path(current_user) # your path
  # end
  
end
