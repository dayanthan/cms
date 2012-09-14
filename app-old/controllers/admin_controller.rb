class AdminController < ApplicationController
	def index 

		
	end


	def login
		if request.post?
			
		if params[:email]=="vima@gmail.com" && params[:password]=="vima123"
			
			session[:admin_id]="admin"
			flash[:notice]="Welcome Admin"
			#redirect_to(:controller=>"stores")
  	      redirect_to(:controller =>"users", :action =>"index")

			
			else
			flash[:notice]="Invalid admin name/password"
		end	
		end	
		end

	
	def logout
		session[:admin_id] = nil
		flash[:notice] = "Logged out"
		redirect_to(:action => "login" )		
	end

def edit
	@user=User.find_by_user_id(current_user.user_id)
end

def show
	@user=User.find_by_user_id(current_user.user_id)
end

def update
   if current_user.user_type == false 
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated user."
      redirect_to users_url
    else
      render :action => 'edit'
    end
  else 
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated user."
     redirect_to admin_url
    else
      render :action => 'edit'
    end
 end
end
  def message
  end

  def dotnet
     @users=User.find(:all, :conditions => { :role => 'dotnet'})
  end

  def socialmedia
     @users=User.find(:all, :conditions => { :role => 'socialmedia'})
  end

  def opensource
     @users=User.find(:all, :conditions => { :role => 'opensource'})
  end

  def welcome
  
  end
  
end
# 192.168.0.166 