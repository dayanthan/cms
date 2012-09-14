class Message < ActiveRecord::Base
# attr_accessible :receiver_id, :sender_id
   attr_accessible :subject, :description, :receiver_id, :sender_id, :user_id
    belongs_to :user 

   belongs_to :sender, :class_name=>"User", :foreign_key=>"sender_id"
   belongs_to :receiver, :class_name=>"User", :foreign_key=>"receiver_id"


end
