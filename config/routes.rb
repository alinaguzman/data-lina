Rails.application.routes.draw do

  root :to => 'data#index'
  scope '/data' do
    resources :runs
    get 'strava/runs', to: 'runs#strava_index'
    resources :checkins
    get 'swarm/checkins', to: 'checkins#swarm_index'
    resources :wines
  end

end
