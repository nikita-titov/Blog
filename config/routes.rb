Rails.application.routes.draw do

  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'admin'
  mount RailsAdmin::Engine => '/vendor/gems/ruby_admin', as: 'rails_admin'
  
  resources :posts do
  	resources :comments
  end
  
  root 'posts#index'

  get '/about', to: 'pages#about'
  get '/contacts', to: 'pages#contacts'

end