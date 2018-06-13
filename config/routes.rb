Rails.application.routes.draw do
	namespace 'api' do
		namespace 'v1' do
			resources :posts
			resources :comments

	 end
  end
	    resources :users, only: :create do
	 	collection do
	    post 'confirm'
	    post 'login'
	    end
	   
	    end
end
