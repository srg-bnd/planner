# frozen_string_literal: true

Rails.application.routes.draw do
  default_url_options host: ENV['DEFAULT_URL_OPTIONS']

  root 'profile#show'
  get '/:locale' => 'schedules#index'

  scope '(:locale)', locale: /en|ru/ do
    devise_for :users
    get 'profile' => 'profile#show'

    resources :schedules, only: %i[index show new create edit update destroy] do
      resources :occupations, only: %i[index show new create edit update destroy] do
        resources :tasks, only: %i[index create update destroy]
      end

      resources :subjects, only: %i[index create update destroy]
      resources :places, only: %i[index create update destroy]
      resources :field_of_activities, only: %i[index create update destroy]
    end

    resources :habits, only: %i[index create update destroy] do
      collection do
        get 'progress'
      end
    end
    resources :habit_days, only: %i[create update destroy]

    resources :checktasks, only: %i[index create update destroy] do
      member do
        get 'done'
      end
    end

    defaults format: :json do
      namespace :api do
        namespace :v1 do
          resources :schedules, only: %i[index]
        end
      end
    end
  end
end
