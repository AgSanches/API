Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #

  namespace 'api' do
    namespace 'v1' do
      post '/login', to: 'users#login'
      post '/users/:id', to: 'users#update'
      post '/admin', to: 'users#admin'
      resources :brands
      resources :products
      resources :users, only: [:create, :destroy, :show, :index]
      resources :opinions
      resource :sizes, only: [:create, :update, :destroy]
    end
  end

end
