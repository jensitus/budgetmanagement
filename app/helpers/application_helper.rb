module ApplicationHelper
  def flash_class(level)
    case level
      when 'notice' then
        'alert alert-info'
      when 'primary' then
        'alert alert-primary'
      when 'secondary' then
        'alert alert-secondary'
      when 'success' then
        'alert alert-success'
      when 'warning' then
        'alert alert-warning'
      when 'danger' then
        'alert alert-danger'
      when 'info' then
        'alert alert-info'
      when 'light' then
        'alert alert-light'
      when 'alert' then
        'alert alert-dark'
    end
  end
end
