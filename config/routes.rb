Rails.application.routes.draw do
  devise_for :users

  resources :submissios, only: [ :index, :create, :show, :destroy ] do
	  resources :questions, only: [ :index, :show ] do
	  	resources :answers, only: [ :create, :update ]
	  end
	end

	resources :cpvs, only: [ :index ]
	resources :questions, only: [ :index, :create, :edit, :update, :destroy ]

  root to: 'pages#home'
  get '/formio', to: 'pages#formio', as: 'formio'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
