module ApplicationHelper
  def semantic_class_for flash_type
    { success: 'ui green message', error: 'ui red message', warning: 'ui yellow message'}[flash_type.to_sym]
  end

  def flash_messages(opts = {})
    flash.map do |msg_type, message|
      content_tag(:div, message, class: "#{semantic_class_for(msg_type)}") do
        content_tag(:i, nil, class: 'close icon') + message
      end
    end.join.html_safe
  end
end
