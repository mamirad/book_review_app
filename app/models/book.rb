class Book < ApplicationRecord
  has_many :reviews, dependent: :destroy

  validates :name, presence: { message: 'must be present' }
  validates :author, presence: { message: 'must be present' }
end
