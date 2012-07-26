class CreateUserConfigs < ActiveRecord::Migration
  def change
    create_table :user_configs do |t|

      t.timestamps
    end
  end
end
