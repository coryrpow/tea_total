Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post "/subscribe", to: "subscriptions#create"
      patch "/cancel", to: "subscriptions#update"
      get "/subscriptions", to: "subscriptions#index"
    end
  end
end
