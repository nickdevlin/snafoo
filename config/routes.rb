Rails.application.routes.draw do
  root 'suggestions#index'
  get 'new', to: 'suggestions#new'
  post 'new', to: 'suggestions#create'

  resource :vote, only: :create
end
