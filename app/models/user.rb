class User < ActiveRecord::Base
	 # acts_as_authentic
	 	  acts_as_authentic do |c|
     	   c.login_field = :email
  	  end
        has_many :messages
  
    has_many :sent_messages, :class_name => "Message", :foreign_key => "sender_id"
    has_many :received_messages, :class_name => "Message", :foreign_key => "receiver_id"


  	  has_many :roles
  	  has_many :designations
    belongs_to :user
   
 		 has_attached_file :photo, :styles => { :medium => "150x150>", :original => "400x400>" },
                :path => ":rails_root/public/system/photos/:id/:style/:basename.:extension", 
                :url  => "/system/photos/:id/:style/:basename.:extension"
	validates_attachment_content_type :photo, :content_type => %w( image/jpeg image/png image/gif image/pjpeg image/x-png ),:message=>"Please Upload Image"
  	  
   attr_accessible :username, :email, :password, :password_confirmation, :is_active, :user_type,:user_id, :crypted_password, :password_salt, :persistence_token, :gender, :photo, :photo_file_name,:photo_content_type,:photo_file_size, :photo_updated_at, :role,:designation ,:role_name,:designation_name,:role_id
	validates_presence_of :username
	validates_uniqueness_of :email
	validates_presence_of :email
	validates_confirmation_of :password
	validates_presence_of :password, :on => :create
	
has_attached_file :photo, :styles => { :small => "150x150>", :large => "400x400>" },
                :path => ":rails_root/public/system/users/:id/:style/:basename.:extension", 
                :url  => "/system/users/:id/:style/:basename.:extension"

 	#validates_attachment_presence :photo
  

def self.find_by_id(id)
    find(id) rescue nil
  end

end
