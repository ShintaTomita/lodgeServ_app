class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :name
      t.string :introduce
      t.integer :price
      t.string :image
      t.string :address

      t.timestamps
    end
  end
end
