class Group < ActiveRecord::Base
  has_many :groupings
  has_many :articles, through: :groupings
after_commit :flush_cache

def flush_cache
	Rails.cache.delete([self.class.name, id])
end

def self.cached_groups

	Rails.cache.fetch("groups", :expires_in => 5.minutes) { Group.all.to_a } 
	#     	Rails.cache.fetch([self, "comments"]) { comments.to_a }
	# Rails.cache.fetch("groups", :expires_in => 5.minutes) do
	# 	#Product.all.joins(:inventory).conditions.where("inventory.quantity = 0")
	# end
end

end
