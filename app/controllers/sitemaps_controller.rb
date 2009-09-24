class SitemapsController < ApplicationController
  def sitemap
    SITEMAP_MODELS.each do |model_name|
      @models[model_name] = Object.const_get(model_name.titleize).send(:all)
    end
    
    render :action => 'google_sitemap'
  end  
end
