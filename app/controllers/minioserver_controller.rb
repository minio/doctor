/*
 * Doctor, (C) 2016 Minio, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
 
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
 
