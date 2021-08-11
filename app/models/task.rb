class Task < ApplicationRecord
  belongs_to :status
  validates :name, presence: true, length: { minimum: 3, maximum: 80 }
  validates :pr, presence: true, length: { minimum: 10, maximum: 100 }
  validates :houes, presence: true, numericality: { in: 0..8 }
end
