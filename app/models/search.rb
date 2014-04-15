class Search < ActiveRecord::Base

	# after_commit :flush_cache

	# def flush_cache
	# 	Rails.cache.delete([self.class.name, id])
	# end

	def self.save_search(params)
	    self.where( keywords: params[:keywords]  ,group_id: params[:group_id]).first_or_create do |search,keywords, group_id|
	      search.keywords = keywords if keywords.present?
	      search.group_id = group_id if group_id.present? and group_id !=""
	    end
	end

	def results
	  @results ||= find_articles
	end

	def to_param
		"#{id}-#{keywords}".parameterize
	end

	private

	def find_articles
	  articles = Article.order(:title)
	  articles = articles.where("articles.title ILIKE ?", "%#{keywords}%") if keywords.present?
	  articles = articles.includes(:groupings).where("groupings.group_id = ?", group_id).references(:groupings) if group_id.present? and group_id !=""
	  articles
	end



end
