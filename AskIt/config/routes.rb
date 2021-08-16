Rails.application.routes.draw do
  get '/questions', to: 'questions#index'
  resources :questions

  root 'pages#index'

end
