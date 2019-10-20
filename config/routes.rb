Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  namespace :api do
    namespace :v1 do
      resources :users
      
      namespace :plants do
        get :generate_gifs, to: :plants#generate_gif
      end
      
      resources :plants do
        resources :pictures, only: :create
      end
    end
  end
end
