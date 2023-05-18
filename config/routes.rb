Rails.application.routes.draw do
  root "plants#index"
  
  get "/plants", to: "plants#index"
  get "/plant-statuses", to: "plant_statuses#index"
end
