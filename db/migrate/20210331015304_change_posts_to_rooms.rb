class ChangePostsToRooms < ActiveRecord::Migration[6.1]
  def change
    rename_table :posts, :rooms
  end
end
