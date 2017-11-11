class CreateCities < ActiveRecord::Migration[5.1]
  def change
    create_table :cities do |t|
      t.string :name
      t.string :state
      t.datetime :date
      t.string :purpose
      t.string :country
      t.string :state

      t.timestamps
    end
  end
end
