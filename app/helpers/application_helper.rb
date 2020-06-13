module ApplicationHelper
  def flash_alert(msg_type, msg)
    type = (msg_type == "notice" ? "success" : "warning")
    icon_custom = (msg_type == "notice" ? "check-circle" : "exclamation-triangle")

    content_tag(:div, "", class: "alert alert-#{type} alert-dismissible text-justify", role: "alert") do
      concat(
        "<a href='#' class='close' data-dismiss='alert' aria-label='close' title='close'>×</a>".html_safe
      )
      concat(
        "<i class='fas fa-#{icon_custom} mr-2'></i> #{msg}".html_safe
      )
    end
  end

  def is_active_path?(path, section = nil)
    true if current_page?(path)
  end

  def active_path(path, section = nil)
    "active-li" if is_active_path?(path)
  end

  def active_section(path = [])
    path.each do |min_path|
      return "menu-open" if is_active_path?(min_path)
    end
    return ""
  end

end
