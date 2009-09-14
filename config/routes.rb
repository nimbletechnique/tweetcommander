ActionController::Routing::Routes.draw do |map|

  map.resources :photos
  
  map.root :controller => "photos"
  
  map.login "/login", :controller => "oauth", :action => "login"
  map.oauth "/oauth", :controller => "oauth", :action => "authorize"
  map.logout "/logout", :controller => "oauth", :action => "logout"

end
