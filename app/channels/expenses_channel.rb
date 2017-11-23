class ExpensesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "expenses_channel"
  end
end