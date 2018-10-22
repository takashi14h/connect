Rails.application.routes.draw do

  devise_for :users
  root 'tops#top'
  # get 'users/index'
  # get 'users/show'
  # get 'users/create'
  # get 'users/edit'
  # get 'users/update'
  # get 'users/destroy'
  # get 'favorites/index'
  # get 'catalogs/new'
  # get 'catalogs/index'
  # get 'catalogs/show'
  # get 'catalogs/create'
  # get 'catalogs/edit'
  # get 'catalogs/update'
  # get 'catalogs/destroy'
  get 'catalogs/fav1/:id' => 'catalogs#fav1', as: "fav1_catalogs"
  get 'catalogs/fav2/:id' => 'catalogs#fav2', as: "fav2_catalogs"
  get '/follow/:id' => 'relationships#follow', as: 'follow'
  get 'users/followed/:id' => 'users#followed', as: "users_followed"
  get 'users/follower/:id' => 'users#follower', as: "users_follower"
  get 'users/toukou/:id' => 'users#toukou', as: "users_toukou"
  get 'users/okini/:id' => 'users#okini', as: "users_okini"
  resources :users, only: [:index, :show, :create, :edit, :update, :destroy]
  resources :catalogs do
    resource :favorites, only: [:index, :create, :destroy]
    resource :likes, only: [:create, :destroy]
  end


  get 'lab' => 'tops#lab'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
