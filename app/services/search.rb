class Search

  def initialize(user_ids, search_value, current_user, book)
    @user_ids = user_ids
    @search_value = search_value
    @current_user = current_user
    @book = book
  end

  def call
    @reviews = @book.reviews.where(user_id: @user_ids)

    if @search_value
      @reviews.joins(:user).where("title LIKE ? OR description LIKE ? OR user_name LIKE ?", "%#{@search_value}%", "%#{@search_value}%", "%#{@search_value}%")
    else
      @reviews.order("created_at DESC")
    end
  end

end

