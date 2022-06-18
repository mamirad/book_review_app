class HomeController < ApplicationController

  def index
    @current_user = current_user
    if @current_user
      @users = User.where.not(id: @current_user.id)
    else
      render 'home/index'
    end
  end

end
