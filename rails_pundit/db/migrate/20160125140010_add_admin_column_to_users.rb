class AddAdminColumnToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.integer :admin, default: 0
    end
  end
end
