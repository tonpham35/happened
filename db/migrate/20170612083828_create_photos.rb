class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
      t.datetime :time_taken
      t.string :lat
      t.string :long

      t.timestamps
    end
  end
end
