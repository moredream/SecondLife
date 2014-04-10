class AddCountToArticles < ActiveRecord::Migration
  def self.up
    add_column :articles, :comments_count, :integer, default: 0, null: false

    Article.all.each do |f|
      Article.reset_counters(f.id, :comments)
    end

  end

  def self.down
    remove_column :articles, :comments_count
  end
end
