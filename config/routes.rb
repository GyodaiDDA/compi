Rails.application.routes.draw do
  root to: 'home#index'
  resources :treatments
  resources :reminders
  resources :medications
  resources :prescriptions
  resources :professionals
  resources :patients
  resources :stashes
  devise_for :users
  
end
