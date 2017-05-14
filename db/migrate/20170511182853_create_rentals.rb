class CreateRentals < ActiveRecord::Migration
  def change
    create_table :rentals do |t|
      t.references :renter, references: :users
      t.references :book

      t.timestamps(null: false)
    end
  end
end
