Rails.application.routes.draw do
  get 'users/search'

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  resources :pictureboard, only: [:index]
  resources :posts, only: [:create]
  resources :albums, only:[:index, :create, :destroy]
  # root "pictureboard#index"
  root "albums#index"
  get '/index' => "albums#index"
  get 'albums/all' => "albums#all"
  get 'albums/mine' => "albums#mine"
  # mount ImageUploader::UploadEndpoint => "/posts/images"
  mount ImageUploader.upload_endpoint(:cache) => "/images/upload"
  mount ImageUploader.upload_endpoint(:store) => "/images/upload_store"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
