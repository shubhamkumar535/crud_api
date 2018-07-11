Rails.application.routes.draw do
  resources :users
 resource  :verifications
 root to: 'users#new'

end
