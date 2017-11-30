class Expense < ApplicationRecord
  belongs_to :user
  belongs_to :household
  has_many :expense_categories
  has_many :categories, through: :expense_categories

  def self.monthly_statement(month, year)
    where('extract(month from spent_at) = ? and extract(year from spent_at) = ?', month, year)
  end

end
