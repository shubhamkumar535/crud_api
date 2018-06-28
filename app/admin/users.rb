ActiveAdmin.register User do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
 permit_params :email
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
        
actions :all 
index do
   
   selectable_column
   id_column
   column :name
   column :email

   
    actions defaults: true do |i|
    
       if i.approved == false
       link_to('Approve' ,approve_path(i.id), method: :put ,data: { confirm: 'Are you sure?' })
       else
       link_to('Block' ,block_path(i.id), method: :put ,data: { confirm: 'Are you sure?' })

     end

   end


   # column :actions do |item|

     # links = []
   #   links << link_to('Delete', delete_admin_user_path(item),:data => {:confirm => 'Are you sure you want to delete the user?'})
   #   links << link_to('show', show_admin_user_path(item))
         
    
   # end
end

form do |f|
  f.input :email
 
  f.submit
end


controller do 
   def approve
       @user=User.find(params[:id])
     if @user.update(approved: true)
      @user.send_confirmation_instructions
       redirect_to admin_user_path(@user)
     else
       render :admin_user
     end
   end

   def block
     @user=User.find(params[:id])
     if @user.update(approved: false)
       redirect_to admin_user_path(@user)
     else
       render :admin_user
     end
   end

end


end
