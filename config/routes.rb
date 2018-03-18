Rails.application.routes.draw do
  get :search, controller: :books
  root "books#index"
end
