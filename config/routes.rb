Rails.application.routes.draw do
  root to: 'links#index'
  resources :links, except: :new
  post '/links/:id', to: 'messages#create', as: 'messages'
  get '/:name', to: 'links#redirect', as: 'redirect_link'
end
