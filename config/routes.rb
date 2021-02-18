Rails.application.routes.draw do
  get 'ingredients/new'
  get 'ingredients/create'

  resources :cocktails do
    resources :doses, only: [:new, :create, :destroy]
  end

  resources :doses, only: [] do
    resources :ingredients, only: [:new, :create]
  end

  resources :doses, only: :destroy
end
