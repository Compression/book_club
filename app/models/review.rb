class Review < ActiveRecord::Base
  belongs_to :book

  validates :review, :book, presence: true
  validates :book, length: { maximum: 85 }
  validates :review, length: { maximum: 255 }
  validates :rating, presence: true
end
