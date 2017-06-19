class CreateStoryMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :story_members do |t|
      t.references :story, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
