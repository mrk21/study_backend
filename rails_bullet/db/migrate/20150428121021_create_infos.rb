class CreateInfos < ActiveRecord::Migration
  def change
    create_table :infos do |t|
      t.string :data
      t.integer :value_id, null: false
      t.timestamps null: false
    end
  end
end
