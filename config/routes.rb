Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    post "/users" => "users#create"
    post "/sessions" => "sessions#create"

    get "/shifts" => "shifts#index"

    get "/organisation" => "organisations#index"
    post "/organisation" => "organisations#create"
    patch "/organisation/:id" => "organisations#update"
    delete "/organisation/:id" => "organisations#delete"
  end
end
