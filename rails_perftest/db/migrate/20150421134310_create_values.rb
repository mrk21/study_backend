class CreateValues < ActiveRecord::Migration
  def change
    create_table :values do |t|
      t.string :value, null: false
      t.timestamps null: false
    end
  end
end
