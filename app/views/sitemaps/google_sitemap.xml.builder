xml.instruct!
 
xml.urlset "xmlns" => "http://www.google.com/schemas/sitemap/0.84" do
  xml.url do
    xml.loc         "http://#{HOST}/"
    xml.lastmod     Time.now.to_s(:w3cdate)
    xml.changefreq  "always"
  end
 
  @models.each do |model_name, models|
    controller_name = model_name.downcase.pluralize 
      models.each do |list|
        xml.url do
          xml.loc         url_for(:only_path => false, :controller => controller_name}, :action => 'show', :id => list.id)
          xml.lastmod     list.updated_at.to_s(:w3cdate) 
          xml.changefreq  "weekly"
          xml.priority    0.8
        end
      end  
  end
  
  SITEMAP_URLS.each do |url|
    xml.url do
      xml.loc         url
      xml.changefreq  "weekly"
      xml.priority    0.8
    end
  end
    
end