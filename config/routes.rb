Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    authenticated :user do
      root 'categories#index', as: :authenticated_root
    end
    unauthenticated do
      root 'pages#index', as: :unauthenticated_root
    end
  end

  resources :categories, only: [:index, :new, :create] do
    resources :transaktions, only: [:index, :new, :create] do
      resources :categorie_transaktions, only: [:create]
    end
  end
end
