ActionController::Routing::Routes.draw do |map|
  map.connect '/sitemap.xml', :controller => 'sitemaps', :action => "sitemap", :format => "xml"
end