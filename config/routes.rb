Rails.application.routes.draw do
	resources :responders, except: [:show]
	get "/responders/:name" => 'responders#show'
end
