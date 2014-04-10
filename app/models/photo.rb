require 'file_size_validator'

class Photo < ActiveRecord::Base
  belongs_to :user
  belongs_to :attachable, polymorphic: true
  
  mount_uploader :image, ImageUploader

  validates :user_id, presence: true
  validates :image, :file_size => { :maximum => 0.5.megabytes.to_i }
  
  scope :available,  lambda { |num = nil| includes(:user).limit(num) }
  scope :trending,   -> { includes(:user).order('comments.created_at desc') }
  
  def to_writer
    "By #{user.name} #{created_at.strftime("%B %d, %Y")}".titleize
  end

  def default_name
    self.name ||= File.basename(image.filename, '.*').titleize if image
  end

  def to_jq_upload
    {
      "name" => read_attribute(:image),
      "size" => image.size,
      "url" => image.url,
      "thumbnail_url" => image.thumb.url,
      "delete_url" => id,
      "delete_type" => "DELETE"
    }
  end

end
