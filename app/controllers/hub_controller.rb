#
 # Doctor, (C) 2016 Minio, Inc.
 #
 # Licensed under the Apache License, Version 2.0 (the "License");
 # you may not use this file except in compliance with the License.
 # You may obtain a copy of the License at
 #
 #     http://www.apache.org/licenses/LICENSE-2.0
 #
 # Unless required by applicable law or agreed to in writing, software
 # distributed under the License is distributed on an "AS IS" BASIS,
 # WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 # See the License for the specific language governing permissions and
 # limitations under the License.
 #
 
class HubController < ApplicationController
  layout 'application'
  
  require 'open-uri'
  def index
     
    @document = Document.first
    file = open(@document.link).read  
    
    @contents = Redcarpet::Markdown.new(Redcarpet::Render::HTML.new, :tables=>true,:fenced_code_blocks => true,
          :no_intra_emphasis => true,
          :autolink => true,
          :strikethrough => true,
          :lax_html_blocks => true,
          :superscript => true).render(file)
  end
  
  def dashboard
     @categories = Category.all
     @documents = Document.all
     @users = User.all
     @brands = Brand.all
  end
end
