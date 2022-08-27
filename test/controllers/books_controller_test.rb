require "test_helper"



class BooksControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    get '/users/sign_in'
    sign_in users(:one)
    post user_session_url
  end

  test "should get index" do
    get books_path
    # assert_equal "index", @controller.action_name
    assert_response :success
  end

  test "should create new " do
    get new_book_url
    assert_response :success
  end

  test "should create Book" do
    assert_difference("Book.count") do
      post books_url, params: { book: { name: "Rails 7", author: "Robert Harry" } }
    end
    assert_redirected_to book_path(Book.last.id)
  end

  test "should edit Book" do
    get edit_book_path(Book.last.id)
    assert_response :success
  end

  test "should update Book" do

    patch book_url(Book.last), params: { book: { name: "Rails 7.0.3" } }
    assert_equal "Rails 7.0.3", Book.last.name

  end

  test "should destroy Book" do
    
    assert_difference("Book.count", -1) do
      delete book_url(Book.last.id)
    end

  end
end
