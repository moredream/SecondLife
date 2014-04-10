class Group < ActiveRecord::Base
  has_many :groupings
  has_many :articles, through: :groupings

  def self.cached_groups
    Rails.cache.fetch([self, "groups"]) { Group.all.to_a }
  end

end
