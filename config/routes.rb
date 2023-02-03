Rails.application.routes.draw do
  root 'users#index'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create], path: 'posts' do
      resources :comments, only: [:create, :new]
      resources :likes, only: [:create, :destroy]
    end
  end

end
