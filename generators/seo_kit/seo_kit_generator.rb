require File.expand_path(File.dirname(__FILE__) + "/lib/insert_commands.rb")
class SeoKitGenerator < Rails::Generator::Base
  def manifest
    record do |m|
      m.insert_into "app/controllers/application_controller.rb", 
%q{
  def canonical_url(canonical_url)
    @canonical_url = canonical_url
  end
}       
      m.insert_into 'app/helpers/application_helper.rb', 
%q{
  def canonical_link_tag
    tag(:link, :rel => :canonical, :href => @canonical_url) if @canonical_url
  end
}
    m.append_into "app/views/layouts/application.html.haml",
%q{
- content_for :head do 
  = canonical_link_tag 
} 
      m.file "seo.rb", "config/initializers/seo.rb"
    end
  end
  
end
