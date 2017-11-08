class CreateWines < ActiveRecord::Migration[5.1]
  def change
    create_table :wines do |t|
      t.string :grapes
      t.string :winery
      t.string :year
      t.string :region
      t.integer :rating
      t.string :description
      t.datetime :date
      t.string :purchased
      t.string :location

      t.timestamps
    end
  end
end
