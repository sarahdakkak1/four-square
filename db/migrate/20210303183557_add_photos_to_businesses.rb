class AddPhotosToBusinesses < ActiveRecord::Migration[6.0]
  def change
      add_column :businesses, :photos, :string
  end
end
