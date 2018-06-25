ActiveAdmin.register User do
	actions :all, except: :edit
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end


index do
   selectable_column
   id_column
   column :email
   column() { |instance| link_to 'approve' }
   column() { |instance| link_to 'block'}
  
    actions
 end

member_action :approve, :method => :post do
    # Just a regular controller method in here
    user = User.find params[:id]
    user.approve!
    redirect_to admin_user_path(user)
  end
  member_action :block, :method => :post do
    # Just a regular controller method in here
    user = User.find params[:id]
    user.block!
    redirect_to admin_user_path(user)
  end
# controller do

# def show
# 	binding.pry
# 	@user= User.find(params[:id])
# end

# def destroy
# 	 @user = User.find(params[:id])
#      @user.destroy
#  end


# def Block
# 	 if @user = User.find(params[:id])
# 	 @user.Block
# end	

# end
# end
end