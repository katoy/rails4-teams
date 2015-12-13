Rails.application.routes.draw do
  root 'teams#index'
  get 'teams/list/(:id)', to: 'teams#list', as: 'teams_list'
  resources :teams
  resources :staffs do
    resources :members
  end
  resources :developers do
    resources :members
  end
end
