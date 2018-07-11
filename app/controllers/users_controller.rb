class UsersController < ApplicationController

 
  def new
    @users = User.new
  end

  def create
    
    @users = User.new(user_params)
    #@users.otp= Random.rand(1000..9999)
    @users.otp=rand(36**4).to_s(36)
    if @users.save
      # Instantiate a Twilio client
      client = Twilio::REST::Client.new(TWILIO_CONFIG['sid'], TWILIO_CONFIG['token'])
      # Create and send an SMS message
     client.api.account.messages.create(
       from: "+14252121179",
        to: @users.phone,
         body: "Thanks for signing up. To verify your account, please reply  to 
                 this message. #{@users.otp}")
      redirect_to new_user_path
    else
      render :new
    end
   
  end
   
   private
     def user_params
     params.require(:users).permit(:name,:email,:phone,:otp)       
    end
end
