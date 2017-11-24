class Expense < ApplicationRecord
  belongs_to :user
  belongs_to :household

  def self.monthly_statement(month)
    where('extract(month from spent_at) = ?', month)
  end

end
