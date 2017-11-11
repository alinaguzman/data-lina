Rails.application.routes.draw do

  root :to => 'data#index'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  resources :sessions, only: [:create]

  scope '/data' do
    resources :runs
    get 'strava/runs', to: 'runs#strava_index'
    resources :checkins
    get 'swarm/checkins', to: 'checkins#swarm_index'
    resources :wines
    resources :sales
    resources :books
  end

end
