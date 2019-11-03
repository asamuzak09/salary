class CreateTimeCards < ActiveRecord::Migration[5.2]
  def change
    create_table :time_cards do |t|
      t.references :user, null:false
      t.integer :year, null:false
      t.integer :month, null:false
      t.references :salary, null:false
      t.timestamps
    end
  end
end
