class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :length
      t.string :author
      t.string :name
      t.string :format
      t.string :genre
      t.datetime :started
      t.datetime :date
      t.string :description
      t.integer :rating

      t.timestamps
    end
  end
end
