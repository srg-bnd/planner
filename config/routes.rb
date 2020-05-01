Rails.application.routes.draw do
  root 'schedules#index'
  get '/:locale' => 'schedules#index'

  scope '(:locale)', locale: /en|ru/ do
    resources :auth, only: [:new, :create]

    resources :schedules, only: [:index, :show] do
      resources :occupations, only: [
        :index, :show, :new, :create, :edit, :update, :destroy
      ]
    end

    defaults format: :json do
      namespace :api do
        namespace :v1 do
          resources :schedules, only: [:index, :show]
        end
      end
    end
  end
end
