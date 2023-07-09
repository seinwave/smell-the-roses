# frozen_string_literal: true

Rails.application.routes.draw do
  root 'plants#index'

  resources :plants, defaults: { format: :json }
  resources :plant_statuses

  resources :map
end
