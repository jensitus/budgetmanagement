class Monthly
  attr_accessor :month, :bill, :year, :categories

  def initialize(month, year, categories)
    @month= month
    @year = year
    @bill = 0
    @categories = categories
  end
end