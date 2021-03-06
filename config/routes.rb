Rails.application.routes.draw do
  root :to => "admin#index"
  # Login
  get 'admin/index'
  get 'admin/login'
  post 'admin/checkLogin'
  get 'admin/logout'
  #########################
  # Brand
  get 'admin/newBrand'
  get 'admin/editBrand/:id', to: 'admin#editBrand', as:'editBrand'
  ########################
  # Product
  get 'admin/newProduct'
  get 'admin/editProduct/:id', to:'admin#editProduct', as:'editProduct'
  get 'admin/newSize/:id', to:'admin#newSize', as:'newSize'
  get 'admin/editSize/:id', to:'admin#editSize', as:'editSize'
  delete 'admin/destroySize/:id', to:'admin#destroySize', as:'destroySize'
  get 'admin/manageSize/:id', to:'admin#manageSize', as:'manageSize'
  get 'admin/destroyProduct'
  ########################
  # Panel Info
  get 'admin/newPanelInfo'
  get 'admin/editPanelInfo/:id', to:'admin#editPanelInfo', as:'editPanelInfo'
  delete 'admin/deletePanelInfo/:id', to:'admin#deletePanelInfo', as:'deletePanelInfo'
  ########################
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  namespace 'api' do
    namespace 'v1' do
      get '/recommends', to:'products#recommends'
      get '/trending', to:'products#trending'
      get '/getIndexBrands', to:'brands#getIndexBrands'
      get '/pageProducts/:limit', to:'products#pageProducts'
      get '/getLastProducts/:limit', to:'products#getLastProducts'
      get '/getSales/:limit', to:'products#getSales'
      get '/getPanelByType/:type_panel', to: 'index_panel_infos#getPanelByType'
      post '/login', to: 'users#login'
      post '/users/:id', to: 'users#update'
      post '/admin', to: 'users#admin'
      resources :brands, only: [:create, :show, :index, :update]
      resources :products, only: [:create, :show, :index, :update]
      resources :users, only: [:create, :destroy, :show, :index]
      resources :opinions
      resources :index_panel_infos
      resource :sizes, only: [:create, :update, :destroy]
    end
  end

end
