Dashing::Engine.routes.draw do

  resources :events,      only: :index

  resources :dashboards,  only: :index do
    get '/:name', action: :show,    on: :collection
  end

  resources :widgets,     only: [] do
    get '/:name', action: :show,    on: :collection
    put '/:name', action: :update,  on: :collection
  end

  root to: 'dashboards#index'
  get '/dashing/authorization' => 'sessions#authorization'
  get '/authorization' => 'sessions#authorization'
  get '/sign_in' => 'sessions#new'
  get '/sign_out' => 'sessions#destroy'
  get '/auth/github/callback' =>'sessions#create'
end
