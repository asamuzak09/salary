Rails.application.routes.draw do
  get 'admin/new' => "admin#new"
  post "admin/create" => "admin#create"
  devise_for :admins
  devise_for :users
  get 'shift/index' => "shift#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
