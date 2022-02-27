class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.datetime :entry_time
      t.datetime :leave_time

      t.timestamps
    end
  end
end
