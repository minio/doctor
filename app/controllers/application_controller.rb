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


class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_filter :load_sidebar
  before_filter :authorize

  delegate :allow?, to: :current_permission
  helper_method :allow?


  private
  
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue ActiveRecord::RecordNotFound
  end
  helper_method :current_user
  
  
  
  def current_permission
    @current_permission ||= Permission.new(current_user)
  end

  def authorize
    if !current_permission.allow?(params[:controller], params[:action])
      redirect_to login_path, alert: "Not authorized."
    end
  end  

  def load_sidebar
    
    @categories = Category.includes(:documents).order("documents.id asc")
    @documents = Document.where(:category_id => params[:id])
    @mybrand = Brand.first 
  end
end
