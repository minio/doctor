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



  layout :resolve_layout
  
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
      
    mixpanel.track("Home Page Viewed")  
    # prepare the suggested edit URL from the document.link          
    @gitlink = @document.link.dup
    @gitlink = @gitlink.sub('raw.githubusercontent','github')
    @gitlink = @gitlink.sub('master', 'blob/master') 
            
  end
  
  def dashboard
     @categories = Category.all
     @cat_count = Category.count
     
     @documents = Document.all
     @doc_count = Document.count
     
     @users = User.all
     @user_count = User.count
     
     @brands = Brand.all
     mixpanel.track("DashBoard Viewed")  
  end
  
  private

   def resolve_layout
     case action_name
     when "dashboard"
       "adminlayout"
     when "index"
       "application"
     else
       "application"
     end
   end
   
end
