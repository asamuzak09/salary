class CreateWorkingHours < ActiveRecord::Migration[5.2]
  def change
    create_table :working_hours do |t|
      t.references :shift, null:false
      t.time :punch_in, null:false
      t.integer :rest_minute, null:false
      t.time :punch_out, null:false
      t.timestamps
    end
  end
end
