class Book < ActiveRecord::Base
  has_many :reviews

  validates :title, presence: true, length: { maximum: 55 }
  validates :author, presence: true, length: { maximum: 55 }
  validates :year, presence: true, length: { maximum: 4 }
end
