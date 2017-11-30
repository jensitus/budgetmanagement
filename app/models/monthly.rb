class Monthly
  attr_accessor :month, :bill, :year

  def initialize(month, year)
    @month= month
    @year = year
    @bill = 0
  end
end