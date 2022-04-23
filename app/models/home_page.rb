class HomePage < ApplicationRecord
  belongs_to :user
  has_many :expenses_categories, dependent: :destroy
  has_many :expenses, through: :expenses_categories

  has_one_attached :icon

  validates :name, presence: true, length: { in: 1..20 }
  validates :icon, presence: true
end
