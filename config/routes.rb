Rails.application.routes.draw do
 
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
   root 'users#index'

  get 'faq', to: 'users#faq'
  get 'help', to: 'users#help'
  get 'privacypolicy', to: 'users#privacy-policy'
  get 'termsconditions', to: 'users#terms-conditions'
end




