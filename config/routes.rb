Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/develop', as: 'rails_admin'
  devise_for :admins
  get "users/index" => "user#index"
  get "users/new" => "user#new"
  post "users/create" => "user#create"
  delete "users/destroy/:id" => "user#destroy"
  get "users/edit/:id" => "user#edit"
  post "users/update/:id" => "user#update"
  get "users/salary/:id" => "user#salaryedit"
  post "users/salaryupdate/:id" => "user#salaryupdate"
  get "users/salarytotal/:id" => "user#salarytotal"
  get "users/:id" => "user#show"
  get '/' => "home#top"
  get 'admin/new' => "admin#new"
  post "admin/create" => "admin#create"
  get "admin/edit/:id" => "admin#edit"
  get "admin/index" => "admin#index"
  post "admin/update" => "admin#update"
  delete "admin/destroy/:id" => "admin#destroy"
  get "admin/:id" => "admin#show"
  get 'shift/index' => "shift#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
