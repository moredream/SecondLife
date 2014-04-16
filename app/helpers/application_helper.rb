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
      when "default" then "label label-default sg-shortcuts"
      when "primary" then "label label-primary sg-shortcuts"
      when "success" then "label label-success sg-shortcuts"
      when "info" then "label label-info sg-shortcuts"
      when "warning" then "label label-warning sg-shortcuts"
      when "danger" then "label label-danger sg-shortcuts"
      else  "label label-info sg-shortcuts"
    end
  end
  
end
