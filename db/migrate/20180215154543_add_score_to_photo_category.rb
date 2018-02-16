class AddScoreToPhotoCategory < ActiveRecord::Migration[5.1]
  def change
    add_column :photo_categories, :score, :integer
  end
end
