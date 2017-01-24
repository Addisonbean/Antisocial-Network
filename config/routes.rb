Rails.application.routes.draw do
	root "static_pages#home"

	get "/signup", to: "users#new", as: :new_user
	resources :users, except: [:index, :new], param: :username

end
