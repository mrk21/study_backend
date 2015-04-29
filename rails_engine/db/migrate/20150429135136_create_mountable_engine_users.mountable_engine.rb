# This migration comes from mountable_engine (originally 20150429135019)
class CreateMountableEngineUsers < ActiveRecord::Migration
  def change
    create_table :mountable_engine_users do |t|
      t.string :model

      t.timestamps null: false
    end
  end
end
