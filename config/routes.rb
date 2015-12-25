Rails.application.routes.draw do

  authenticated do
    root 'organizations#show', as: :authenticated
  end

  root 'visitors#index'

  devise_for :users

  resources :organizations

end
