Rails.application.routes.draw do
  get 'admin' => 'admin#index'
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end
  get 'sessions/create'
  get 'sessions/destroy'

  # START_HIGLIGHT
  resources :support_requests, only: %i[ index update ]
  # END_HIGLIGHT

  resources :users
  resources :orders
  resources :line_items
  resources :carts
  resources :products

  scope '(:locale)' do
    resources :orders
    resources :line_items
    resources :carts
    root 'store#index', as: 'store_index', via: :all
  end
end
