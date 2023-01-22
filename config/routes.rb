Rails.application.routes.draw do
  get 'posts/index'
  get 'posts/new'
  get 'posts/:id' => 'posts#show'
  post 'posts/create'
  get 'posts/:id/edit' => 'posts#edit'
  post 'posts/:id/update' => 'posts#update'
  post 'posts/:id/destroy' => 'posts#destroy'

  get '/' => 'home#top'
  get 'about' => 'home#about'
end
