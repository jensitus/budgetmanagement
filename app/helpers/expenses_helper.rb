module ExpensesHelper
  def fix_it(amount)
    sprintf '%.2f', amount
  end

  def month_name(month)
    case month
      when '1' then
        'Januar'
      when '2' then
        'Februar'
      when '3' then
        'März'
      when '4' then
        'April'
      when '5' then
        'Mai'
      when '6' then
        'Juni'
      when '7' then
        'Juli'
      when '8' then
        'August'
      when '9'
        'September'
      when '10' then
        'Oktober'
      when '11' then
        'November'
      when '12' then
        'Dezember'
    end
  end

end
