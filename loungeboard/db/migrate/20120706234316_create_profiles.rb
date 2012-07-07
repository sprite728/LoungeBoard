class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :firstname
      t.string :lastname
      t.text :bio
      t.string :twitter

      t.timestamps
    end
  end
end
