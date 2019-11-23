class CreateShifts < ActiveRecord::Migration[5.2]
  def change
    create_table :shifts do |t|
      t.references :time_card, null:false
      t.string :kind, null:false
      t.date :date, null:false
      t.time :start_at
      t.integer :rest_minutes
      t.time :end_at
      t.integer :preparation
      t.timestamps
    end
  end
end
