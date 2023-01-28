Rails.application.routes.draw do
  post 'users/:id/update' => 'users#update'
  get "users/:id/edit" => "users#edit"
  post 'users/create'
  get 'signup' => 'users#new'
  get 'users/index'
  get 'users/:id/edit' => 'users#edit'
  get 'users/:id' => 'users#show'

  get 'records/index'
  get 'records/new'
  get 'records/:id' => 'records#show'
  post 'records/create'
  get 'records/:id/edit' => 'records#edit'
  post 'records/:id/update' => 'records#update'
  post 'records/:id/destroy' => 'records#destroy'

  get '/' => 'home#top'
  get 'about' => 'home#about'
end
