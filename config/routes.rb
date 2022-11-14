Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: %i[index show create update destroy]
      post 'auth/sign_in', to: 'authentication#sign_in'
      get 'auth/me', to: 'authentication#current_user'
      resources :properties, only: %i[index show create update destroy]
      resources :addresses, only: %i[index show create update destroy]
      resources :property_images, only: %i[index show create update destroy]
      resources :blocked_periods, only: %i[index show create update destroy]
      resources :categories, only: %i[index show create update destroy]
      resources :hostings, only: %i[index show create update destroy]
      resources :reservations, only: %i[index show create update destroy]

    end
  end

  
end


 #{
  #success: true,
  #data: {
    #user: user,
    #accessToken: JWT_TOKEN,
  #}
