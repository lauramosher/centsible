# frozen_string_literal: true

Rails.application.routes.draw do
  root to: "home#index"
  devise_for :users

  get "/dashboard", to: "dashboard#index"
  resources :categories
end
