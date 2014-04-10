class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :name
      t.string :image
      t.references :user, index: true
      t.references :attachable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
