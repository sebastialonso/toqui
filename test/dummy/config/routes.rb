Rails.application.routes.draw do
  get 'home/index'

  # Pass as: :api, if you need routes for an API JSON
  # toqui_lift as: :api
  toqui_lift
  root "home#index"
end
