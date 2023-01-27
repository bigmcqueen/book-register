Rails.application.routes.draw do
  get 'records/index' => 'records#index'
  get 'records/:id' => 'records#show'
  get 'records/new'
  get 'records/edit'

  get '/' => 'home#top'
  get 'about' => 'home#about'
end
