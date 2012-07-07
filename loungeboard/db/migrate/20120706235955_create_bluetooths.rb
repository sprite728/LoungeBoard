class CreateBluetooths < ActiveRecord::Migration
  def change
    create_table :bluetooths do |t|
      t.string :macaddr

      t.timestamps
    end
  end
end
