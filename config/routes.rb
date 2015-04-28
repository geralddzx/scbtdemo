Rails.application.routes.draw do
  devise_for :users
  root to: "static_pages#home"
  get "admin"=>"static_pages#admin"
  get "student"=>"static_pages#student"

  namespace :api, defaults: {format: :json} do
  	resources :users
  	resources :news
  	resources :events
  	resources :media
    resources :inquiries do
      put "mark_read" => "inquiries#mark_read"
    end
  end
end