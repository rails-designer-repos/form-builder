Rails.application.routes.draw do
  mount RailsIcons::Engine, at: '/rails_icons'
  root to: "pages#show"
end
