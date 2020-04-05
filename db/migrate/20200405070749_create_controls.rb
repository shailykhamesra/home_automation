class CreateControls < ActiveRecord::Migration[6.0]
 def change
    create_table :controls do |t|
      t.string :name
      t.integer :pin
      t.time :configure, :default => Time.now.utc
      t.time :configureoff, :default => Time.now.utc
      t.boolean :automated, :default => false
      t.timestamps
    end
  end
end