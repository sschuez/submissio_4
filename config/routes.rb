Rails.application.routes.draw do
  devise_for :users

  resources :submissios, only: [ :index, :create, :show, :destroy ] do
	  resources :questions, only: [ :index, :show ] do
	  	resources :answers, only: [ :create, :update ]
	  end
	end

	resources :questions, only: [ :index, :create, :update, :destroy ]

	get 'form_io', to: 'pages#form_io'

  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
