class UserSessionsController < ApplicationController

  # before_filter :require_no_user, :only => [:new, :create]
  # before_filter :require_user, :only => :destroy

  def new
    @user_session = UserSession.new
  end

 def create
    session[:user_username] = params[:user_session][:username]
    @user_session = UserSession.new(params[:user_session])
    @user = User.find_by_email(params[:user_session][:email])
  
   current_user = @user
   @user_session.save
    if current_user.user_type == true and current_user.is_active == true
            if current_user.role == "dotnet"
              @user_session.save
              flash[:notice] = "Login successful!"
              redirect_to(:controller =>"admin", :action =>"dotnet")
          
            elsif current_user.role == "opensource"
              @user_session.save
              flash[:notice] = "Login successful!"
              redirect_to(:controller =>"admin", :action =>"opensource")
 
            elsif current_user.role == "socialmedia"
              @user_session.save
              flash[:notice] = "Login successful!"
              redirect_to(:controller =>"admin", :action =>"socialmedia")
            else  current_user.user_type == true and current_user.is_active == true and current_user.role &= "dotnet" and current_user.role &= "opensource" and current_user.role  &= "socialmedia"
              @user_session.save
            flash[:notice] = "Login successful!,please wait for admin's permission !"
            redirect_to(:controller =>"admin", :action =>"message")
            end
             
   elsif current_user.is_active == false
            @user_session.save
            flash[:notice] = "please wait for admin's permission !"
            redirect_to(:controller =>"admin", :action =>"index")
   elsif current_user.user_type ==false   ## false -->1
              @user_session.save
              flash[:notice] = "Successfully logged in."
              redirect_to(:controller =>"users", :action =>"index")       
   else
          flash[:notice]="username/password is incorrect"
           redirect_to(:controller =>"user_sessions", :action =>"new")       
   
   end
end

  def destroy
    #current_user_session.destroy
    #flash[:notice] = "Logout successful!"
    #redirect_to root_url
     @user_session = UserSession.find(current_user)

     @user_session.destroy
      flash[:notice] = "Successfully logged out."
      redirect_to "/"
  
  end
end