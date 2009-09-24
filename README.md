Installing
==========

script/plugin install git://github.com/peteonrails/seo-kit.git
script/generate seo_kit

What you get
============
Canonical link tag helpers 
--------------------------
This is handy if you're using friendly_id or you have more than one way 
to see an instance of a particular model. Setting a canonical URL of the URL generated by the path helpers
will ensure that search engines recognize the duplicate content and do not split page rank. 


In your controllers:

  def show
    @user = User.find(params[:id])
    canonical_url @user
  end

In your views: 

  <%= canonical_link_tag %>
   
   OR
   
   = canonical_link_tag
  
If you have app/views/layouts/application.html.haml and a "=yield :head"" call set up, 
then this is set up for you by default. 

Sitemap Generators
------------------
The route /sitemap.xml will produce a valid sitemap for you. To
update which models are included in the sitemap, see 

  config/initializers/seo.rb
  
Add downcased model names to the SITEMAP_MODELS array to include more models. To include named routes 
or other URLs that we can't use generators (e.g. pages controlled by high_voltage), you can list
them in the SITEMAP_URLS field. For example: 

SITEMAP_URLS = [
  "http://mysite.org/faq.html",
  "http://mysite.org/about.html",
  "http://mysite.org/privacy.html"  
]

Notes
-----
I strongly recommend that you also install the "friendly_id" plugin and use it to generate 
well-named links for your important models. Be sure to set canonical_urls on the show action 
in your controllers for these objects, since they will be addressable in two ways:

http://host/users/1
http://host/users/fasteragile

You want the canonical_url to be http://host/users/fasteragile

