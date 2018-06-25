class UsersController < ApplicationController
 
def index

	@users=User.all
end
def login
end

def create
   redirect_to  register_path
end



end
