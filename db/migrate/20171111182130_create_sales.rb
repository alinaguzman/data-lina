class CreateSales < ActiveRecord::Migration[5.1]
  def change
    create_table :sales do |t|
      t.string :app
      t.string :name
      t.float :price
      t.float :earnings
      t.datetime :date
      t.text :description

      t.timestamps
    end
  end
end
