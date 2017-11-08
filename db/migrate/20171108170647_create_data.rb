class CreateData < ActiveRecord::Migration[5.1]
  def change
    create_table :data do |t|
      t.string :klass
      t.datetime :date
      t.integer :foreign_id

      t.timestamps
    end
  end
end
