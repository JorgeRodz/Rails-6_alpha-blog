Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # This is the index page of our app
  root 'pages#home'

  # assing a route using a controller
  get 'about', to: 'pages#about'

  # ---------- articles routes ----------

  # resources :articles = provide all of this routes [:show, :index, :new, :create, :edit, :update, :destroy]
  resources :articles # This line are providing the REST pattern -> Representation State Transfer - mapping HTTP verbs (get, post, put/patch, delete) to CRUD actions just like the line above. This is also provides REST-ful routes...this means we can acces this values like an API RESTFUl providing a JSON response and working the frontend with other tecnologies like React, Angular, Vue, etc. In this case we just want to work with the Rails Fullstack.


  # ---------- users routes ----------

  get 'signup', to: 'users#new'
  resources :users, except: [:new]


  # ---------- session routes ----------

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

end
