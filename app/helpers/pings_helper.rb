module PingsHelper
  def ping_date(ping)
    return '-' if ping.nil?

    ping.created_at.to_fs(:ping_time)
  end

  def ping_response(ping)
    return '-' if ping.nil?

    ping.response_time
  end

  def ping_alive(ping)
    return '-' if ping.nil?

    if ping.alive
      content_tag(:div, class: 'flex items-center') do
        concat(content_tag(:div, '', class: 'h-2.5 w-2.5 rounded-full bg-green-500 mr-2'))
        concat('Success')
      end
    else
      content_tag(:div, class: 'flex items-center') do
        concat(content_tag(:div, '', class: 'h-2.5 w-2.5 rounded-full bg-red-500 mr-2'))
        concat('Failure') # Fixed typo from "Failre" to "Failure"
      end
    end
  end
end
