class CreateConfigs < ActiveRecord::Migration
  def change
    create_table :configs, comment: 'application configuration' do |t|
      t.string :name, comment: 'config name'
      t.integer :value, comment: 'config value'
    end
  end
end
