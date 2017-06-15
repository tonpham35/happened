class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.references :story, foreign_key: true
      t.string :what
      t.string :why
      t.string :string
      t.datetime :when
      t.string :photo
      t.string :where
      t.string :mode_of_transport
      t.string :flight_num
      t.datetime :flight_time
      t.datetime :flight_date
      t.string :accomodation_type
      t.string :accomodation_address
      t.datetime :accomodation_checkin
      t.datetime :accomodation_checkout

      t.timestamps
    end
  end
end
