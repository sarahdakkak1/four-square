class RemovePhotosFromBusinesses < ActiveRecord::Migration[6.0]
  def change
    remove_column :businesses, :photos, :string
  end
end
