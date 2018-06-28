ActiveAdmin.register StaticContent do
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
 permit_params :sname, :scontent 

  index do
    selectable_column
    id_column
    column :sname
    column :scontent
    
    actions
  end

  

  form do |f|
    f.inputs do
      f.input :sname
      f.input :scontent
      
    end
    f.actions
  end
end
