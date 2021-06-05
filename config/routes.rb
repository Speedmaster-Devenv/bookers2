Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  root to: 'homes#top'
  get 'top' => 'homes#top'
  resources :books, except: :new
  resources :users, except: [:delete, :destroy]
end
