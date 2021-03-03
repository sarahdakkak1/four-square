class CreateBusinesses < ActiveRecord::Migration[6.0]
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :type
      t.string :slug
      t.string :style
      t.string :address
      t.string :website
      t.string :phone_number
      t.boolean :outdoor
      t.boolean :delivery
      t.boolean :instore
      t.boolean :mask
      t.string :menu

      t.timestamps
    end
  end
end
