Rails.application.routes.draw do
  root 'teams#index'
  get 'teams/list/(:id)', to: 'teams#list', as: 'teams_list'
  resources :teams
end
