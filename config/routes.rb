Rails.application.routes.draw do
  root 'home#index'
  match 'about', to: "about#index", :via => [:get, :post]
  match 'help', to: "help#index", :via => [:get, :post]
  match 'count', to: "count#index", :via => [:get, :post]
  #match 'error_404', to: "error_404#index", :via => [:get, :post]
  #match '*not_found', to: 'error_404#index', :via => [:get, :post] unless Rails.application.config.consider_all_requests_local
end
