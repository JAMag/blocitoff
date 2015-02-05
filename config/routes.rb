Rails.application.routes.draw do
  get 'items/show'

  get 'items/new'

  get 'items/edit'

  resources :lists, except: [:index]

  devise_for :users
  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end
