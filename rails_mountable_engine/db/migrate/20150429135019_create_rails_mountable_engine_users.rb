class CreateRailsMountableEngineUsers < ActiveRecord::Migration
  def change
    create_table :rails_mountable_engine_users do |t|
      t.string :model

      t.timestamps null: false
    end
  end
end
