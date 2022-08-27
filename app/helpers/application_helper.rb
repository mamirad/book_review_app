module ApplicationHelper
  def alert_class key
    case key
    when 'notice'
      'warning'
    when 'alert'
      'danger'
    end
  end
end
