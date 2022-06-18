require "test_helper"

class ReviewTest < ActiveSupport::TestCase
  
  test "return true" do
    review =  Review.new
    review.title = "title"
    review.description = "description"
    review.rate = 5
    review.user = User.first
    review.book = Book.first
    assert review.save, "Condition True"
  end

  test "Every Field is Required" do
    review =  Review.new
    review.title = ""
    review.description = ""
    review.rate = ""
    
    assert_not review.save, "Should Not Save, Every Fieldis required"
  end

  test "Title is Required" do
    review =  Review.new
    review.title = ""
    review.description = "description"
    review.rate = 5
    review.user = User.first
    review.book = Book.first
    
    assert_not review.save, "Title Required"
  end

  test "Description is Required" do
    review =  Review.new
    review.title = "title"
    review.description = ""
    review.rate = 5
    review.user = User.first
    review.book = Book.first
    
    assert_not review.save, "Description Required"
  end

  test "Rate is Required" do
    review =  Review.new
    review.title = "title"
    review.description = "description"
    review.rate = 
    review.user = User.first
    review.book = Book.first
    
    assert_not review.save, "Rate Required"
  end

  test "Book is Required" do
    review =  Review.new
    review.title = "title"
    review.description = "description"
    review.rate = 5
    review.user = User.first
    
    
    assert_not review.save, "Book  Required"
  end

  test "User is Required" do
    review =  Review.new
    review.title = "title"
    review.description = "description"
    review.rate = 5
    review.book = Book.first
    
    
    assert_not review.save, "User  Required"
  end

end
