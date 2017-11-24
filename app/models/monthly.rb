class Monthly
  attr_accessor :month, :bill

  def initialize(month)
    @month= month
    @bill = 0
  end
end