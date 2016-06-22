class MinioserverController < ApplicationController
  require 'open-uri'
  
  def index
  
      file = open("https://raw.githubusercontent.com/deekoder/doctest/master/README.md").read 
      @contents = Redcarpet::Markdown.new(Redcarpet::Render::HTML.new).render(file)
      respond_to do |format|
         format.html { render :inline => @contents.html_safe , :layout=>'application'  }
      end   
  end
  
end
 