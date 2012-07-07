class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :name
      t.text :bio
      t.date :birthdat
      t.string :color
      t.string :twitter

      t.timestamps
    end
  end
end
