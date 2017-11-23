class HouseholdsChannel < ApplicationCable::Channel
  # def subscribed(data)
  #   stream_from stream_from "household_expenses"
  # end

  def follow(data)
    stop_all_streams
    stream_from "household_#{data['household_id'].to_i}_expenses"
  end

  def unfollow
    stop_all_streams
  end
end