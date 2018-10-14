Rails.application.routes.draw do
  devise_for :users
  root 'tops#top'
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
  resources :catalogs do
    resource :favorites, only: [:index, :create, :destroy]
    resource :likes, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
