Rails.application.routes.draw do
  namespace :staff do 
    root "top#index"
  end

  namespace :user do 
    root "top#index"
  end
end
