# frozen_string_literal: true

Rails.application.routes.draw do
  default_url_options host: ENV['DEFAULT_URL_OPTIONS']

  root 'schedules#index'
  get '/:locale' => 'schedules#index'

  scope '(:locale)', locale: /en|ru/ do
    devise_for :users
    get 'cabinet' => 'cabinet#show'

    resources :schedules, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
      resources :occupations, only: [
        :index, :show, :new, :create, :edit, :update, :destroy
      ] do
        resources :tasks, only: [:index, :create, :update, :destroy]
      end

      resources :subjects, only: [:index, :create, :update, :destroy]
      resources :places, only: [:index, :create, :update, :destroy]
      resources :field_of_activities, only: [:index, :create, :update, :destroy]
    end

    defaults format: :json do
      namespace :api do
        namespace :v1 do
          resources :schedules, only: [:index]
        end
      end
    end
  end
end
