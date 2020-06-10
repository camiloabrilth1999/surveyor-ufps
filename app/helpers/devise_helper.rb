module DeviseHelper
  def devise_error_messages!
    return "" if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join

    html = <<-HTML
    <div class="alert alert-warning alert-dismissible text-justify" role="alert">
      <a href="#" class="close" data-dismiss="alert" aria-label="close" title="close">×</a>
      <i class="fa fa-exclamation-triangle"></i>
      Ha ocurrido un error
        <ul>
          #{messages}
        </ul>
      </div>
    HTML

    html.html_safe
  end
end
