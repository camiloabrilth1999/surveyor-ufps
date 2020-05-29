module DeviseHelper
  def devise_error_messages!
    return "" if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join

    html = <<-HTML
    <div class="bg-white p-4 border border-yellow-600 border-l-8 my-3 rounded shadow mx-4 lg:mx-0">
      <div class="flex items-start">
        <div class="px-2">
          <i class="far fa-exclamation-circle fa-2x text-yellow-600"></i>
        </div>
        <div class="px-2">
          <p class="font-bold text-yellow-700">#{t('devise.errors.title')}</p>
          <ul class="text-sm text-yellow-700">
            #{messages}
          </ul>
        </div>
      </div>
    </div>
    HTML

    html.html_safe
  end
end
