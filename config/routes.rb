Rails.application.routes.draw do
  root 'teams#index'
  get 'teams/list/(:id)', to: 'teams#list', as: 'teams_list'
  resources :teams

  resources :people

  namespace :api, format: 'json' do
    namespace :v1 do
      resources :teams
      resources :people
    end
  end
end
