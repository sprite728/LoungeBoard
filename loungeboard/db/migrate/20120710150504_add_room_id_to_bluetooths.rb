class AddRoomIdToBluetooths < ActiveRecord::Migration
  def change
    add_column :bluetooths, :room_id, :integer
  end
end
