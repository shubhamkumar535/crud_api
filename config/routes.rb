Rails.application.routes.draw do
 
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users,controllers: {sessions: 'sessions'}
   root 'users#index'
   get 'users', to: 'users#index'

  get 'faq', to: 'users#faq'
  get 'help', to: 'users#help'
  get 'privacypolicy', to: 'users#privacy-policy'
  get 'termsconditions', to: 'users#terms-conditions'

  put 'admin/users/approve/:id', to: 'admin/users#approve', as: "approve"
  put 'admin/users/block/:id', to: 'admin/users#block', as: "block"

end




