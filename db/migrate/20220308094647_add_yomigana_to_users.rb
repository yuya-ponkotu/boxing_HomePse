class AddYomiganaToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :yomigana, :string
  end
end
