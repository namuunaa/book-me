class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :author, {null: false}
      t.string :title, {null: false}
      t.string :genre, {null: false}
      t.string :body
      t.integer :owner_id, {null: false}

      t.timestamps(null: false)
    end
  end
end
