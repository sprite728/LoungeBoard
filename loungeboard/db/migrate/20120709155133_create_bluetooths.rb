class CreateBluetooths < ActiveRecord::Migration
  def change
    create_table :bluetooths do |t|
      t.integer :user_id
      t.string :mac_addr

      t.timestamps
    end
  end
end
