class RemoveColumnFromFriendship < ActiveRecord::Migration[5.1]
  def change
    remove_column :friendships, :destroy
    remove_column :friendships, :create
  end
end
