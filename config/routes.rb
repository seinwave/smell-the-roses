Rails.application.routes.draw do
  root "roses#index"
  
  get "/roses", to: "roses#index"
end
