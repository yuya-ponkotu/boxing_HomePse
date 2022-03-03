class AddInRoomToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :in_room, :boolean, default: false
  end
end
