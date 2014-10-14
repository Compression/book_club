class Review < ActiveRecord::Base
  belongs_to :book

  validates :review, presence: true, length: { maximum: 255 }
  validates :rating, presence: true
end
