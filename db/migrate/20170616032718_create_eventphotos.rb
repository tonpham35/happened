class CreateEventphotos < ActiveRecord::Migration[5.1]
  def change
    create_table :eventphotos do |t|
      t.references :event, foreign_key: true
      t.string :photo
      t.string :lat
      t.string :long
      t.datetime :datetime
      t.string :type_of_event

      t.timestamps
    end
  end
end
