Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'static_pages#root'
  
  resources :users, only: [:new, :show, :create] do
    resources :posts
  end
  resource :session, only: [:new, :create, :destroy, :show]

end
