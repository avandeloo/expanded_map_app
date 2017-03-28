Rails.application.routes.draw do

  get '/' => 'routes#index'
  get '/location' => 'routes#location'
  get '/location2' => 'routes#location2'
  
  # get '/train_lines' => 'train_lines#index'
  # get '/train_lines/new' => 'train_lines#new'
  # post '/train_lines' => 'train_lines#create'

  # get '/train_lines/:id' => 'train_lines#show'
  # get '/train_lines/:id/edit' => 'train_lines#edit'
  # patch '/train_lines/:id' => 'train_lines#update'

  # delete '/train_lines/:id' => 'train_lines#destroy'

  get '/markers' => 'markers#index'
  get '/markers/new' => 'markers#new'
  post '/markers' => 'markers#create'

  get '/markers/:id' => 'markers#show'
  get '/markers/:id/edit' => 'markers#edit'
  patch '/markers/:id' => 'markers#update'

  delete '/markers/:id' => 'markers#destroy'

  namespace :api do
    namespace :v1 do
      get '/markers' => 'markers#index'
      get '/markers/new' => 'markers#new'
      post '/markers' => 'markers#create'

      get '/markers/:id' => 'markers#show'

      get '/routes' => 'routes#index'

      get '/routes/:id' => 'routes#show'
      post '/routes/new' => 'routes#create'
      
    end
  end

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

end
