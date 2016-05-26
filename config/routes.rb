Rails.application.routes.draw do
  resources :emergencies, except: [:show, :destroy]
end
