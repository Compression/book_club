class Book < ActiveRecord::Base
  validates :title, :author, :year, presence: true, length: { maximum: 55 }
end
