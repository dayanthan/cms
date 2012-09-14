class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :name
      t.string :email
      t.integer :role
      t.string :designation
      t.string :manager

      t.timestamps
    end
  end
end
