Rails.application.routes.draw do
  resources :users
  resources :roles
  root :to => "roles#index"
  # get "active_role_users" => "user#active_role_users"
  get "add_meta_data" => "users#add_meta_data" 
  post "create_meta_data" => "users#create_meta_data"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
