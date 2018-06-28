class User < ApplicationRecord
	mount_uploader :imagename, YourUploaderUploader
	validates_size_of :imagename, maximum: 5.megabyte, message: "Attachment size not exceeds the allowable limit (5 MB)."
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
devise :database_authenticatable, :registerable,
       :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable


 
 def send_devise_notification(notification, *args)
 	#binding.pry
#if self.approved == true
#p notification
 Devise::Mailer.send(notification, self, *args).deliver_now
#else 
#@admins=AdminUser.all
#@admins.each do|i|
#args= "A new user is waiting for approval"
#Devise::Mailer.send(notification, i , args).deliver_now
#end
end



end





