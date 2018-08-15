Rails.application.routes.draw do
  root to: 'links#index'
  resources :links
  get '/:name', to: 'links#redirect', as: 'redirect_link'
end
