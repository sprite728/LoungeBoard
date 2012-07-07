class AddUserIdToBluetooths < ActiveRecord::Migration
  def change
    add_column :bluetooths, :user_id, :integer
  end
end
