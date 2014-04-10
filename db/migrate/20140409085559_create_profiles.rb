class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.references :user, index: true
      t.text :bio
      t.text :lab
      t.string :twitter
      t.string :linkedin
      t.string :mobile
      t.string :url

      t.timestamps
    end
  end
end
