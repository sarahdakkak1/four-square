class AddPhotoToBusinesses < ActiveRecord::Migration[6.0]
  def change
    add_column :businesses, :photo, :string
  end
end
