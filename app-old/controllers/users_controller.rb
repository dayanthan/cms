class UsersController < ApplicationController
	def index
		# @users = User.find(:all)
    @users = User.search(params[:search])
	end

def new
     @user = User.new
    end
  def create
  	 	    @user = User.new(params[:user])
  	   	    @user.user_type = "1"
  		  if @user.save
		    flash[:notice] = "Registration successful. please wait for admin's permission."
    		     redirect_to(:controller =>"admin", :action =>"index")
    		 else
     		   flash[:alert] = "username/password is incorrect!"
     		   redirect_to(:controller =>"users", :action =>"new")
    		 end
            
       end

def show
	@user=User.find_by_user_id(current_user.user_id)
  
  # @user = User.find(params[:id])
end

     def status_toggle
  puts 11111111111111111111  
  puts @user.inspect 
    @user = User.where(:user_id => params[:id]).first
    puts @user.inspect
  puts 22222222222222222  
    @user.is_active ? @user.is_active = false : @user.is_active = true
    @user.save
    redirect_to :back
  end 


# def dotnet
# @users=User.find(:all)
# end


  
def edit
   @user=User.find_by_user_id(current_user.user_id)
	# @user = User.find(params[:id])
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
 #  #if current_user.user_type == false 
 #    @user = User.find(params[:id])
 #    if @user.update_attributes(params[:user])
 #      flash[:notice] = "Successfully updated user."
 #    #  if @user.user_type == true 
 #      redirect_to :action =>"show"
 #    # elsif
 #    #   redirect_to(:controller =>"users", :action =>"show")
 #    else
 #      render :action => 'edit'
 #    end
 # #  else 
 # #    @user = User.find(params[:id])
 # #    if @user.update_attributes(params[:user])
 # #      flash[:notice] = "Successfully updated user."
 # #     #redirect_to admin_url
 # #     redirect_to(:controller =>"users", :action =>"show")

 # #    else
 # #      render :action => 'edit'
 # #    end
 # #  end
 # #end
end
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "Successfully destroyed user."
    redirect_to users_url
  end
def message
end

end
