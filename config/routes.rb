Rails.application.routes.draw do
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
