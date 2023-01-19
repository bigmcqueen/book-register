Rails.application.routes.draw do
  get 'books/index'
  get '/' => 'home#top'
  get 'about' => 'home#about'
end
