class CreateSalaries < ActiveRecord::Migration[5.2]
  def change
    create_table :salaries do |t|
      t.references :user, null:false
      t.integer :priority, null:false

      t.integer :payment0, null:false
      t.integer :payment1, null:false
      t.integer :payment2, null:false
      t.integer :payment3, null:false
      t.integer :payment4, null:false
      t.integer :payment5, null:false
      t.integer :payment6, null:false
      t.integer :payment7, null:false
      t.integer :payment8, null:false
      t.integer :payment9, null:false
      t.integer :payment10, null:false
      t.integer :payment11, null:false
      t.integer :payment12, null:false
      t.integer :payment13, null:false
      t.integer :payment14, null:false
      t.integer :payment15, null:false
      t.integer :payment16, null:false
      t.integer :payment17, null:false
      t.integer :payment18, null:false
      t.integer :payment19, null:false
      t.integer :payment20, null:false
      t.integer :payment21, null:false
      t.integer :payment22, null:false
      t.integer :payment23, null:false
      t.timestamps
    end
    add_index :salaries, [:user_id, :priority], unique: true
  end
end
