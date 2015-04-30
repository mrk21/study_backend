# This migration comes from rails_mountable_engine (originally 20150429135019)
class CreateRailsMountableEngineUsers < ActiveRecord::Migration
  def change
    create_table :rails_mountable_engine_users do |t|
      t.string :model

      t.timestamps null: false
    end
  end
end
