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
end
