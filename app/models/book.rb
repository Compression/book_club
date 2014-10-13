class Book < ActiveRecord::Base
  has_many :reviews
  validates :title, :author, :year, presence: true, length: { maximum: 55 }
end
