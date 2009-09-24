class SitemapsController < ApplicationController
  def sitemap
    SITEMAP_MODELS.each do |model|
      self.instance_eval "@#{model}s = #{model.upcase}.all"
    end
    
    render :action => 'google_sitemap'
  end  
end
