class CreateGroupings < ActiveRecord::Migration
  def change
    create_table :groupings do |t|
      t.belongs_to :group, index: true
      t.belongs_to :article, index: true

      t.timestamps
    end
  end
end
