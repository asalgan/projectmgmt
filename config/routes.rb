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

  get '/brain_dumps/:id/check_done' => 'brain_dumps#check_done'
  put '/brain_dumps/:id/update_completion' => 'brain_dumps#update_completion'
  resources :brain_dumps

  resources :brain_dump_categories

  resources :brain_dump_notes

  resources :brain_dump_assignees

end
