class CreateMainSwitches < ActiveRecord::Migration[6.0]
  def change
    create_table :main_switches do |t|
      t.boolean :control

      t.timestamps
    end
  end
end
