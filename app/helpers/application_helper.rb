module ApplicationHelper
  def link_to_me
    if current_user.first_name.present? || current_user.last_name.present?
      "#{current_user.first_name} #{current_user.last_name}"
    else
      "#{current_user.email}"
    end
    
  end
end
