Rails.application.routes.draw do


  devise_for :users

  authenticated do
    root 'organizations#show', as: :authenticated
  end

  root 'visitors#index'

  resources :organizations do
    member do
      get '/map' => 'organizations#map'
    end
  end

  resources :brain_dumps
  resources :brain_dump_categories
  resources :brain_dump_notes

end
