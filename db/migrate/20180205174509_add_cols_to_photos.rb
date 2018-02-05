class AddColsToPhotos < ActiveRecord::Migration[5.1]
  def change
    add_column :photos, :park_id, :integer
    add_column :photos, :user_id, :integer
  end
end
