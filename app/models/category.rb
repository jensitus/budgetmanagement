class Category < ApplicationRecord
  has_many :expense_categories
  has_many :expenses, through: :expense_categories
  has_many :household_categories
  has_many :households, through: :household_categories
end
