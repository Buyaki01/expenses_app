class Expense < ApplicationRecord
  belongs_to :author, class_name: 'User'

  has_many :expenses_categories, dependent: :destroy
  has_many :home_pages, through: :expenses_categories

  validates :name, presence: true, length: { in: 1..20 }
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 1 }
end
