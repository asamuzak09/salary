class DeviseCreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string :name1,              null: false, default: ""
      t.string :name2,              null: false, default: ""
      t.timestamps null: false
    end
  end
end
