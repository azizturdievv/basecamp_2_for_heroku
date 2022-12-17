Rails.application.routes.draw do
  resources :admin
  resources :vaults
  resources :todosets
  resources :messages
  resources :message_boards
  root 'pages#home'

  resources :projects do
    resources :vaults  
    resources :message_boards do

      resources :messages
  
end

resources :todosets

end

  
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
