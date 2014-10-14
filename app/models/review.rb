class Review < ActiveRecord::Base
  belongs_to :book

  validates :review, :book, presence: true, length: { maximum: 255 }
  validates :review, :rating, presence: true
end
