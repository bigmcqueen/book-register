Rails.application.routes.draw do
  get 'records/index'
  get 'records/show'
  get 'records/new'
  get 'records/edit'

  get '/' => 'home#top'
  get 'about' => 'about'
end
