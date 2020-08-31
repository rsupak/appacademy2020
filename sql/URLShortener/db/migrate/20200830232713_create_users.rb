class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.boolean :premium, default:false
      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
