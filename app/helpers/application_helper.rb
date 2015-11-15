module ApplicationHelper
  # glyph-icon
  def bs_glyph(name)
    content_tag(:span, nil, class: ['glyphicon', "glyphicon-#{name}"])
  end

  # flashを表示するためにbootstrapのalertにマップする
  def alert_class_for(flash_type)
    {
      success: 'alert-success',
      error: 'alert-danger',
      alert: 'alert-warning',
      notice: 'alert-info',
      info: 'alert-info'
    }[flash_type.to_sym] || flash_type.to_s
  end
end
