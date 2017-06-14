class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.references :story, foreign_key: true
      t.string :what
      t.string :why
      t.string :string
      t.datetime :when
      t.string :photo

      t.timestamps
    end
  end
end
