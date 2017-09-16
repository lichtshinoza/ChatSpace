module ApplicationHelper
  def data_display_style(m)
    m.created_at.strftime('%d.%m.%Y, %H:%M')
  end
end
