json.extract! expense, :id, :amount, :description, :spent_at, :created_at, :updated_at
json.url expense_url(expense, format: :json)
