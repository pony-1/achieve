Rails.application.routes.draw do
  get 'notifications/index'

  get 'relationships/create'

  get 'relationships/destroy'

  get 'comments/create'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  get 'users/index'

  get 'top/index'

  resources :blogs do
    resources :comments
    collection do
      post :confirm
    end
  end

  resources :contacts, only: %i[new create] do
    collection do
      post :confirm
    end
  end

  resources :relationships, only: %i[create destroy]

  root 'top#index'

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?

  resources :poems, only: %i[index show]

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  resources :users, only: %i[index show]

  resources :conversations do
    resources :messages
  end
end
