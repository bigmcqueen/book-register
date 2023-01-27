Rails.application.routes.draw do
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
