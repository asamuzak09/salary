Rails.application.routes.draw do
  devise_for :admins
  get "users" => "user#index"
  get "users/new" => "user#new"
  post "users" => "user#create"
  delete "users/destroy/:id" => "user#destroy"
  get "users/edit/:id" => "user#edit"
  patch "users/update/:id" => "user#update"
  get "users/salary/:id" => "user#salaryedit"
  patch "users/salaryupdate/:id" => "user#salaryupdate"
  get "users/salarytotal/:id" => "user#salarytotal"
  get "users/:id" => "user#show"
  get '/' => "home#top"
  get 'admin/new' => "admin#new"
  post "admin/create" => "admin#create"
  get "admin/edit/:id" => "admin#edit"
  get "admin/index" => "admin#index"
  post "admin/update" => "admin#update"
  delete "admin/destroy/:id" => "admin#destroy"
  get "admin/public_holiday" => "admin#public_holiday"
  post "admin/set_holiday" => "admin#set_holiday"
  delete "admin/destroy_holiday/:id" => "admin#destroy_holiday"
  mount RailsAdmin::Engine => '/develop', as: 'rails_admin'
  get "admin/:id" => "admin#show"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
