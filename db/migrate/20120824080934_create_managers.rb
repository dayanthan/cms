class CreateManagers < ActiveRecord::Migration
  def change
    create_table :managers do |t|
      t.string :name
      t.integer :role
      t.string :designation
      t.string :manager

      t.timestamps
    end
  end
end
