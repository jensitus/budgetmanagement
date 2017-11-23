module ApplicationHelper
  def flash_class(level)
    case level
      when 'notice' then
        'alert alert-info'
      when 'primary' then
        'alert alert-primary'
      when 'success' then
        'alert alert-success'
      when 'warning' then
        'alert alert-warning'
      when 'danger' then
        'alert alert-danger'
      when 'alert' then
        'alert alert-dark'
    end
  end
end
