ActionController::Routing::Routes.draw do |map|
  map.root :controller => :departments

  map.resources :departments, :collection => {:sort => :post} do |department|
    department.resources :employees
  end

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
