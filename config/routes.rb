Rails.application.routes.draw do
  get '/current_user', to: 'current_user#index'
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: %i[index show create update destroy]
      post 'auth/sign_in', to: 'authentication#sign_in'
      post 'auth/sign_up', to: 'authentication#sign_up'
    end
  end
end


 #{
  #success: true,
  #data: {
    #user: user,
    #accessToken: JWT_TOKEN,
  #}
