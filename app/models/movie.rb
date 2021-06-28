class Movie < ApplicationRecord
  validates :title, length: { minimum: 2 }
  validates :plot, length: { minimum: 20 }
  validates :year, numericality: { greater_than_or_equal_to: 1878 }
  validates :director, length: { minimum: 2 }
  validates :english, inclusion: [true, false]
  has_many :actors
end
