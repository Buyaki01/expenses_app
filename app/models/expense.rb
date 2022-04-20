class Expense < ApplicationRecord
  belongs_to :author, class_name: 'User'

  has_many :expenses_categories, dependent: :destroy
  has_many :home_pages, through: :expenses_categories
end
