class ExpensesChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'expenses'
  end
end