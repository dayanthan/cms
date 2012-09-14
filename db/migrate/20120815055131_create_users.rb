class CreateUsers < ActiveRecord::Migration
  def change
 create_table :users,:primary_key => :user_id do |t|
   t.string       :email
   t.string       :username
   t.boolean      :user_type, :comment => " 0-Admin, 1-User "
   t.string       :crypted_password  
   t.string       :password_salt
   t.string       :persistence_token
   t.string       :role
   t.string       :designation
   t.boolean      :is_active,     :default => 0    ,:comment=>"1 for Active, 2 for Inactive"
   t.string       :photo_file_name 
   t.string       :photo_content_type
   t.string       :photo_file_size 
   t.datetime     :photo_updated_at
   t.timestamps
    end
  end
end
