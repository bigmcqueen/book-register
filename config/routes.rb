Rails.application.routes.draw do
  get 'posts/index'
  get 'posts/new'
  get 'posts/:id' => 'posts#show'

  get '/' => 'home#top'
  get 'about' => 'home#about'
end
