module ApplicationHelper
	def current_user?(user)
		user == current_user
	end

	def flash_class(level)
		case level
		  when :notice then "alert alert-info"
		  when :success then "alert alert-success"
		  when :error then "alert alert-error"
		  when :alert then "alert alert-alert"
		end
	end

  def tag_class(level)
    case level
      when "default" then "label label-default"
      when "primary" then "label label-primary"
      when "success" then "label label-success"
      when "info" then "label label-info"
      when "warning" then "label label-warning"
      when "danger" then "label label-danger"
      else  "label label-info"
    end
  end
  
end
