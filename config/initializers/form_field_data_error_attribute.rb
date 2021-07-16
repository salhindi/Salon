ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
    if html_tag =~ /<(input|label|textarea|select)/
      html_field = Nokogiri::HTML::DocumentFragment.parse(html_tag)
      html_field.children.each do |c|
        c['data-error'] = instance.error_message.uniq.join(', ')
      end
      html_field.to_s.html_safe
    else
      html_tag
    end
  end