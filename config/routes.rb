# frozen_string_literal: true

Rails.application.routes.draw do
  root to: "dashboard#index"
  devise_for :users

  resources :categories
end
