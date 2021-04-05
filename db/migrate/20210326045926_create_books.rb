class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.date :check_in
      t.date :check_out
      t.integer :total_price
      t.integer :customers
      t.integer :user_id
      t.integer :room_id

      t.timestamps
    end
  end
end
