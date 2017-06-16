class CreateEventphotos < ActiveRecord::Migration[5.1]
  def change
    create_table :eventphotos do |t|
      t.references :event, foreign_key: true
      t.string :photo
      t.float :lat
      t.float :long
      t.datetime :datetime

      t.timestamps
    end
  end
end
