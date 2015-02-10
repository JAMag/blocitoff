Rails.application.routes.draw do

  resources :lists do
    resources :items, except: [:index, :show]
  end

  devise_for :users
  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end
