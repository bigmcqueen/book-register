Rails.application.routes.draw do
  get 'records' => 'records#index'
  get 'records/show'
  get 'records/new'
  get 'records/edit'

  get '/' => 'home#top'
  get 'about' => 'home#about'
end
