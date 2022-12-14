Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  namespace :api do
    namespace :v1 do
      get '/forecast', to: 'forecast#landing'
      get '/munchies', to: 'restaurant#show'
      post '/users', to: 'users#create'
      post '/sessions', to: 'sessions#login'
      post '/road_trip', to: 'road_trips#show'
    end
  end

end
