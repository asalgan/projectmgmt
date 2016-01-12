Rails.application.routes.draw do


  devise_for :users, :controllers => { registrations: 'users/registrations' }

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
  put '/brain_dumps/:id/update_due_date' => 'brain_dumps#update_due_date'
  resources :brain_dumps

  resources :brain_dump_categories

  resources :brain_dump_notes

  resources :brain_dump_assignees

end
