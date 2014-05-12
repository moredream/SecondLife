class AddImageProcessedToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :image_processed, :boolean
  end
end
