module ApplicationHelper
  def is_active_action(action_name)
    params[:action] == action_name ? "active" : nil
  end

  def date_format(datetime)
    if (Time.zone.now - datetime) < 1.day
      distance_of_time_in_words_to_now(datetime) + '前'
    else
      datetime.strftime("%Y年%m月%d日")
    end
  end
end
