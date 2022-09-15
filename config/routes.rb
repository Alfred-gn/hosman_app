Rails.application.routes.draw do
  get 'properties/new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "properties#new"
  resources :properties, only: %i[create index]
  # Defines the root path route ("/")
  # root "articles#index"
end
