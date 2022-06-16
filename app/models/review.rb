class Review < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :title, presence: { message: 'must be present' }
  validates :description, presence: { message: 'must be present' }
  validates :rate, presence: true, format: { with: /\A\d{0,11}(\.?\d{0,2})?\z/ }, numericality: true

  

end
