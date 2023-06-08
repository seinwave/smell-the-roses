# frozen_string_literal: true

Rails.application.routes.draw do
  root 'plants#index'

  resources :plants
  resources :plant_statuses

  resources :map
end
