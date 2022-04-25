class ExpensesCategory < ApplicationRecord
  belongs_to :home_page
  belongs_to :expense
end
