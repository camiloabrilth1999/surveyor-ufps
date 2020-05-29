module ApplicationHelper
  def flash_alert(msg_type, msg)
    color = (msg_type == "notice" ? "green" : "yellow")
    icon_name = (msg_type == "notice" ? "check-circle" : "exclamation-circle")

    content_tag("div", class: "bg-white p-4 border border-#{color}-500 border-green-500 my-3 rounded shadow mx-2 xl:mx-0") do
      content_tag("div", class: "flex items-center") do
        concat(content_tag("div", class: "px-2") do
          "<i class='fad fa-#{icon_name} fa-2x text-#{color}-500'></i>".html_safe
        end)

        concat(content_tag("div", class: "px-2") do
          content_tag("p", class: "font-semibold text-#{color}-700") do
            msg
          end
        end)
      end
    end
  end
end
