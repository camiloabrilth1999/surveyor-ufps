module ApplicationHelper
  def flash_alert(msg_type, msg)
    type = (msg_type == "notice" ? "success" : "warning")
    msg_custom = (msg_type == "notice" ? "Todo ha salido correctamente" : "Advertencia")

    content_tag(:div, "", class: "alert alert-#{type}-custom", role: "alert") do
      concat(
        content_tag(:h4, "#{msg_custom}", class: "alert-heading")
      )
      concat(
        content_tag(:p, msg)
      )
    end
  end
end
