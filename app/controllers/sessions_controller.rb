class SessionsController < Devise::SessionsController
 prepend_before_action :captcha_valid, only: [:create] # Change this to be any actions you want to protect.

 private
   def captcha_valid
     if verify_recaptcha && User.find_by(email: resource_class.new(sign_in_params).email).approved == true
       true
     else
       self.resource = resource_class.new(sign_in_params)
       respond_with_navigational(resource) { render :new }
     end 
   end
end




