class HomePage < ApplicationRecord
  belongs_to :user
  has_one_attached :icon
end
