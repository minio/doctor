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
 
class DocumentsController < ApplicationController
  require 'open-uri'
  before_action :set_document, only: [:show, :edit, :update, :destroy]
  layout :resolve_layout

  # GET /documents
  # GET /documents.json
  def index
    @documents = Document.all
  end

  # GET /documents/1
  # GET /documents/1.json
  def show
    @document = Document.friendly.find(params[:id])
    file = open(@document.link).read 
    @renderer = Render.new;
    @renderer.setDocument(@document);
    @contents = Redcarpet::Markdown.new(@renderer, :tables=>true,:fenced_code_blocks => true,
          :no_intra_emphasis => true,
          :autolink => true,
          :strikethrough => true,
          :lax_html_blocks => true,
          :superscript => true).render(file)
          
    mixpanel.track("Doc Page Viewed", "Page Title" => @document.name )        
    # prepare the suggested edit URL from the document.link      
    @gitlink = @document.link.dup
    @gitlink = @gitlink.gsub("raw.githubusercontent","github")
    @gitlink = @gitlink.sub('master', 'blob/master') 
     
  end

  # GET /documents/new
  def new
    @document = Document.new
  end

  # GET /documents/1/edit
  def edit
  end

  def hide
      @document = Document.friendly.find(params[:id])
      @document.state = "hidden"
      respond_to do |format|
        if @document.save
          format.html { redirect_to request.referrer, notice: 'Document was successfully hidden.' }
        else
          format.html { redirect_to request.referrer, notice: 'Document could not be hidden.' }
        end
      end
  end

  def unhide
      @document = Document.friendly.find(params[:id])
      @document.state = ""
      respond_to do |format|
        if @document.save
          format.html { redirect_to request.referrer, notice: 'Document was successfully hidden.' }
        else
          format.html { redirect_to request.referrer, notice: 'Document could not be hidden.' }
        end
      end
  end

  # POST /documents
  # POST /documents.json
  def create
    @document = Document.new(document_params)

    respond_to do |format|
      if @document.save
        format.html { redirect_to @document, notice: 'Document was successfully created.' }
        format.json { render :show, status: :created, location: @document }
      else
        format.html { render :new }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /documents/1
  # PATCH/PUT /documents/1.json
  def update
    respond_to do |format|
      if @document.update(document_params)
         format.html { render :edit,  notice: 'Document was successfully created.' }
      else
        format.html { render :edit }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /documents/1
  # DELETE /documents/1.json
  def destroy
    @document.destroy
    respond_to do |format|
      format.html { redirect_to documents_url, notice: 'Document was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  
    def resolve_layout
     case action_name
     when "index", "edit","new"
       "adminlayout"
     else
       "application"
     end
    end
  
    # Use callbacks to share common setup or constraints between actions.
    def set_document
      @document = Document.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def document_params
      params.require(:document).permit(:name, :description, :link, :category_id, :state)
    end
end
