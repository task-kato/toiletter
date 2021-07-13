Rails.application.routes.draw do
  namespace :staff do
    root "top#index"
    get "login" => "sessions#new", as: :login
    resource "session", only: [:create, :destroy]
    resources "accounts"
    resources "toilets"
  end

  namespace :user do
    root "top#index"
    get "login" => "sessions#new", as: :login
    resource "session", only: [:create, :destroy]
    resources "accounts"
  end
end
