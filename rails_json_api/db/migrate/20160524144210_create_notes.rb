class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.references :user, null: false
      t.string :title, null: false
      t.text :content

      t.timestamps null: false
    end
  end
end
