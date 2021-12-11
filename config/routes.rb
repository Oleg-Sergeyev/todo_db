Rails.application.routes.draw do
  get 'count/index'
  root 'home#index'
  match 'about', to: "about#index", :via => [:get, :post]
  match 'help', to: "help#index", :via => [:get, :post]
  match 'count', to: "cout#index", :via => [:get, :post]
end
