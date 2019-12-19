Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/develop', as: 'rails_admin'
  devise_for :admins
  get "users/index" => "user#index"
  devise_for :users
  get '/' => "home#top"
  get 'admin/new' => "admin#new"
  post "admin/create" => "admin#create"
  get "admin/edit/:id" => "admin#edit"
  get "admin/index" => "admin#index"
  post "admin/update" => "admin#update"
  post "admin/destroy/:id" => "admin#destroy"
  get "admin/:id" => "admin#show"
  get 'shift/index' => "shift#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
