Rails.application.routes.draw do
  # root 'dashboard#index'
  root 'catalogs#index'

  get '/about', to: 'dashboard#about', as: 'about'
  get '/add_author', to: 'authors#new', as: 'add_author'
  get '/add_publisher', to: 'publishers#new', as: 'add_publisher'
  get '/add_book', to: 'books#new', as: 'add_book'
  get '/signup', to: 'users#new', as: 'signup'
  get '/signin', to: 'sessions#new', as: 'signin'
  post '/signin', to: 'sessions#create'
  get "/reset_password", to: "password_resets#new"

  resources :authors,    except: [:new]
  resources :publishers, except: [:new]
  resources :books, except: [:new] do
    collection do
      post :search, to: 'books#search'
    end
  end

  resources :publications, only: [:new]
  resources :users, except: [:new]
  resources :catalogs, only: [:index, :show]
  resources :carts, only: [:show, :destroy]
  resources :cart_items, only: [:new, :create]
  resource  :session, only: [:destroy]
  resources :orders, only: [:new, :create, :destroy]
end
