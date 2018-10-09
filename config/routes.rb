Rails.application.routes.draw do
  devise_for :users
  root 'tops#top'
  
  # get 'catalogs/new'
  # get 'catalogs/index'
  # get 'catalogs/show'
  # get 'catalogs/create'
  # get 'catalogs/edit'
  # get 'catalogs/update'
  # get 'catalogs/destroy'
  resources :catalogs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
