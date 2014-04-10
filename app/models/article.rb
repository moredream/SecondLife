class Article < ActiveRecord::Base
  belongs_to :user

	scope :trending,  lambda { |num = nil| includes(:user).order('created_at  desc').limit(num) }

end
