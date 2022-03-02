Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # This is the index page of our app
  root 'pages#home'

  # assing a route using a controller
  get 'about', to: 'pages#about'

  resources :articles, only: [:show]

end
