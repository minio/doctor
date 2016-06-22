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
 
module ApplicationHelper
  
  class CodeRayify < Redcarpet::Render::HTML
      def block_code(code, language)
          CodeRay.scan(code, language).div
      end
  end 
  def smarkdown(text)
      coderayified = CodeRayify.new(filter_html: true,  hard_wrap: true)
      options = {
          :fenced_code_blocks => true,
          :no_intra_emphasis => true,
          :autolink => true,
          :strikethrough => true,
          :lax_html_blocks => true,
          :superscript => true
      }
      markdown_to_html = Redcarpet::Markdown.new(coderayified, options)
      markdown_to_html.render(text).html_safe
  end 
   
 def markdown(text)
       options = [:hard_wrap, :filter_html, :autolink, :no_intraemphasis, :fenced_code, :tables ]
       syntax_highlighter(Redcarpet.new(text, *options).to_html).html_safe
 end
  
 def syntax_highlighter(html)
    doc = Nokogiri::HTML(html)
    doc.search("//pre[@lang]").each do |pre|
      pre.replace Albino.colorize(pre.text.rstrip, pre[:lang])
    end
    doc.to_s
 end
  
end
