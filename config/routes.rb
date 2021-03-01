Rails.application.routes.draw do
  devise_for :users

  resources :questions, only: [ :index, :show ] do
  	resources :answers, only: [ :create, :update ]
  end

  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
