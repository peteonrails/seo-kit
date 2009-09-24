class SitemapsController < ApplicationController
  def sitemap
    SITEMAP_MODELS.each do |model|
      instance_eval <<-eoc
        @#{model}s = #{model.upcase}.all
      eoc
    end
    
    render :action => 'google_sitemap'
  end  
end
