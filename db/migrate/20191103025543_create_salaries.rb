class CreateSalaries < ActiveRecord::Migration[5.2]
  def change
    create_table :salaries do |t|
      t.references :user, null:false
      t.integer :priority, null:false

      t.integer :payment, null:false
      t.integer :overtime_pay, null:false
      t.integer :holiday_pay, null:false

      t.timestamps
    end
    add_index :salaries, [:user_id, :priority], unique: true
  end
end
