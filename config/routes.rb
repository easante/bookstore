Rails.application.routes.draw do
  root 'dashboard#index'

  get '/about', to: 'dashboard#about', as: 'about'
  get '/add_author', to: 'authors#new', as: 'add_author'
  get '/add_publisher', to: 'publishers#new', as: 'add_publisher'
  get '/add_book', to: 'books#new', as: 'add_book'

  resources :authors,    except: [:new]
  resources :publishers, except: [:new]
  resources :books, except: [:new]
end
