class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :commentable, polymorphic: true, counter_cache: true

  validates :user_id, presence: true
  validates :content, presence: true


  scope :available,  lambda { |num = nil| includes(:user).limit(num) }
  scope :trending,   -> { includes(:user).order('comments.created_at desc') }

  def to_writer
    "By #{user.name} #{created_at.strftime("%B %d, %Y")}".titleize
  end

end
