Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :hangouts, only: [ :show, :new, :create ] do
    resources :location_choices, only: :create
    resources :date_choices, only: :create
    resources :attendances, only: :create
  end

  resources :location_choices do
    resources :location_votes, only: :create
  end
  resources :date_choices do
    resources :date_votes, only: :create
  end

  resources :attendances, only: :update

  resources :location_votes, only: :destroy
  resources :date_votes, only: :destroy
end
