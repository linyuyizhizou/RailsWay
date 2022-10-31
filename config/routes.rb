Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "application#hello"   #application 去找application_contronller.rb
  root "pages#home"
  get 'about', to: 'pages#about'
  # resources :articles, only: [:show, :index, :new, :create,:edit,:update,:destroy]
  resources :articles  #公开了所有的！
end
