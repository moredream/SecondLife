class Article < ActiveRecord::Base
	
	belongs_to :user
	has_many :photos, as: :attachable
	has_many :comments, as: :commentable
	has_many :groups, through: :groupings
	has_many :groupings
  
	mount_uploader :image, DirectUploader

	scope :trending,  lambda { |num = nil| includes(:user).order('created_at  desc').limit(num) }
	scope :hot,  lambda { |num = nil| includes(:user).order('cached_votes_up  desc').limit(num) }
	scope :available,  lambda { |num = nil| includes(:user).limit(num) }
  	
  	attr_readonly :comments_count
	acts_as_votable
  	
  	after_save :enqueue_image

	# def image_name
	#   File.basename(image.path || image.filename) if image
	# end

  def enqueue_image
    ImageWorker.perform_async(id, key) if key.present?
  end

  class ImageWorker
    include Sidekiq::Worker
    
    def perform(id, key)
      article = Article.find(id)
      article.key = key
      article.remote_image_url = article.image.direct_fog_url(with_path: true)
      article.save!
      article.update_column(:image_processed, true)
    end
  end

	def to_writer
		 "By #{user.name} #{created_at.strftime("%B %d, %Y")}".titleize
	end

	def self.search(query)
		trending.where("title ILIKE ?", "%#{query}%")
	end

	def self.search_tags(keywords, group_id)
		articles = Article.available
		articles = articles.where("title ILIKE ?", "%#{keywords}%") if keywords.present?
		articles = articles.includes(:groupings).where("groupings.group_id = ?", group_id).references(:groupings)  if group_id.present? and group_id !=""
		articles
	end

	def self.from_users_followed_by(user)
		followed_user_ids = user.following_users.pluck(:id)
		where("user_id IN (?) OR user_id = ?", followed_user_ids, user)
	end

	def self.follow_only(user, query)
		articles = Article.trending
		articles = articles.where(user_id: user.following_users.pluck(:id))
		articles = articles.search(query)
		articles
	end

	def self.group_with(name)
		available.includes(:groups).where("groups.name = ?", name).references(:groups)
	end

	def group_list
		groups.map(&:name).join(", ")
	end

	def to_param
		"#{id}-#{title}".parameterize
	end

	def self.trends(num)
		if num.present?
		  hot.limit(num)
		else
		  hot
		end
	end
end
