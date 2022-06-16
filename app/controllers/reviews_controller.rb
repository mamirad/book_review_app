class ReviewsController < ApplicationController

  before_action :find_review, only:[:show, :edit, :update, :destroy]
  before_action :get_book
  # before_action :get_user

  def index
    @user  = User.find(current_user.id)
    @users = @user.following
    user_ids = @users.pluck(:id).push(current_user.id)
    
    if params[:search_key]
      search = params[:search_key]
      @reviews = @book.reviews.where(user_id: user_ids).joins(:user).where("title LIKE ? OR description LIKE ? OR user_name LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
    else
      if current_user
        @reviews = @book.reviews.where( user_id: user_ids ).order("created_at DESC")
      
        authorize @reviews
      end
    end
  end

  def new
    @review = @book.reviews.build
    authorize @review
  end

  def create
    # binding.pry
    @review = @book.reviews.build(review_params)
    @review.user_id = current_user.id
    authorize @review
    if @review.save
      redirect_to book_reviews_path(@book)
    else
      render 'new'
    end
  end

  def show
  end

  def edit
    
  end

  def update
    if @review.update(review_params)
      flash[:notice]="Updated Successfully"
      redirect_to book_review_path(@book)
    else
      render 'edit'
    end
  end

  def destroy
      @review.destroy
      authorize @review
  end


  private
  def find_review
    @review = Review.find(params[:id])
    authorize @review
  end

  def get_book
      @book = Book.find(params[:book_id])
  end
  # def get_user
  #   # binding.pry
  #   @user = User.find(params[:user_id])
  # end

  def review_params
      params.require(:review).permit(:title, :description, :rate, :book_id)
  end
end
