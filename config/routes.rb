Rails.application.routes.draw do
  root 'schedules#index'
  resources :auth, only: [:new, :create]
  resources :schedules, only: [:index, :show]
  resources :occupations, only: [:index, :show, :new, :create,:destroy]
end
