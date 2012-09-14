class MessagesController < ApplicationController

def new
    	 # @user = User.find_by_id( params[:user_id] )
      # @message = Message.new( :receiver_id =>params[:user_id] )
  @message = Message.new

  end



 # def new
 # 	    @user = User.find_by_id(params[:user_id])

 # 	     # @message = current_user.sent_messages.build :receiver_id => params[:receiver_id]
 #     # @message = current_user.sent_messages.build(:receiver_id => params[:user_id])
 #     @message =current_user.sent_messages.build(:receiver_id=>params[:receiver_id])

 #  # @message = current_user.sent_messages.build(:receiver_id=>params[:receiver_id])
 #   end

# def new
#  @message =current_user.sent_messages.build(:receiver_id=>params[:receiver_id])
#   end


def create
  @message =Message.create(:user_id => current_user.user_id,:sender_id =>current_user.user_id, :receiver_id => params[:message][:receiver_id], :subject => params[:message][:subject], :description => params[:message][:description])
  #@message = current_user.sent_messages.create(params[:message])
#  @message = current_user.sent_messages.build(params[:message])
  if @message.save
  flash[:notice] = "Successfully send message."

	if current_user.role == "dotnet"
              redirect_to(:controller =>"admin", :action =>"dotnet")
	elsif current_user.role == "opensource"
              redirect_to(:controller =>"admin", :action =>"opensource")
    elsif current_user.role == "socialmedia"
              redirect_to(:controller =>"admin", :action =>"socialmedia")
    else
    	  redirect_to root_url

    end


else
  render :action => 'new'
 end
 end
  


end
