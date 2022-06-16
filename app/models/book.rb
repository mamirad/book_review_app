class Book < ApplicationRecord
  has_many :reviews

  validates :author, presence: { message: 'must be present' }
end
