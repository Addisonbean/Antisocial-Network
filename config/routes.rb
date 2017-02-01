Rails.application.routes.draw do
	root "static_pages#home"

	get "/signup", to: "users#new", as: :new_user
	resources :users, except: [:index, :new], param: :username

	resources :posts, only: [:create, :destroy, :update]

	get    "/login",  to: "sessions#new"
	post   "/login",  to: "sessions#create"
	delete "/logout", to: "sessions#destroy"

end
