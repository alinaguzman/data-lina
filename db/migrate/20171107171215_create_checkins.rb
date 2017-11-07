class CreateCheckins < ActiveRecord::Migration[5.1]
  def change
    create_table :checkins do |t|
      t.string :name
      t.string :type
      t.datetime :date
      t.jsonb :payload
      t.string :address
      t.string :city
      t.string :swarm_id

      t.timestamps
    end
  end
end
