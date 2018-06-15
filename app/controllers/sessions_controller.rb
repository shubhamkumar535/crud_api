class SessionsController < ApplicationController
	
   def new
 	   @user = User.new
 	end

 	def create
        # debugger    
		 @user = User.find_by(email: params[:user][:email])
 
 		if  @user && @user.authenticate(params[:user][:password])
            session[:user_id]=@user.id
            redirect_to movies_path

        else
            redirect_to login_path
        end
    end

    def destroy
        session[:user_id]=nil
        redirect_to login_path
    end                


end
