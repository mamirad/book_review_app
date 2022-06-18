require "test_helper"

class BookTest < ActiveSupport::TestCase

  test "should  return true" do
    book = Book.new
    book.name = "xyz"
    book.author = "abc"
    assert book.save ,"Insertion Done"
  end

  test "author and name should not be empty" do
    book = Book.new
    book.name = ""
    book.author = ""
    assert_not book.save , "saving book without title and author"
  end

  test "title should not be empty" do
    book = Book.new
    book.name = ""
    book.author = "abc"
    assert_not book.save , "saving book without title"
  end

  test "author should not be empty" do
    book = Book.new
    book.name = "book1"
    book.author = ""
    assert_not book.save , "saving book without author"
  end
end
