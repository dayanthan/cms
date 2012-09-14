class CreateDevelopers < ActiveRecord::Migration
  def change
    create_table :developers do |t|
      t.string :name
      t.integer :role
      t.string :designation
      t.string :manager
      # t.birth_date :date

      t.timestamps
    end
  end
end
