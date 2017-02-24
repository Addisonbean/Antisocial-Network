Rails.application.routes.draw do
	root "static_pages#home"

	get "/signup", to: "users#new", as: :new_user
	resources :users, except: [:index, :new], param: :username

	resources :posts, only: [:create, :destroy, :update]

	get    "/login",  to: "sessions#new"
	post   "/login",  to: "sessions#create"
	delete "/logout", to: "sessions#destroy"

	get "/feed/:page", to: "static_pages#page", as: :feed_page
	patch "/update_bio", to: "users#update_bio"

	get "/notifications", to: "notifications#show"

end
