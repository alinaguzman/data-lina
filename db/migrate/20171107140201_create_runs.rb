class CreateRuns < ActiveRecord::Migration[5.1]
  def change
    create_table :runs do |t|
      t.boolean :race
      t.string :name
      t.float :miles
      t.string :finish
      t.string :pace
      t.string :description
      t.string :strava
      t.datetime :date
      t.string :activity_id

      t.timestamps
    end
  end
end
