Rails.application.routes.draw do
  devise_for :users
 resources :recipes do
 	member do
 		put "like", to: "recipes#upvote"
 		put "dislike", to: "recipes#downvote"
 	end
 	resources :comments
 end

 root "recipes#index"
end