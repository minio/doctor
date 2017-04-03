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
    # Add custom flash types
    add_flash_types :success, :warning, :danger, :info, :inverse

    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception
    before_filter :redirect_https
    before_filter :load_sidebar
    before_filter :authorize

    delegate :allow?, to: :current_permission
    helper_method :allow?
    include Mengpaneel::Controller
    before_action :setup_mixpanel

    private

    def redirect_https
        redirect_to :protocol => "https://" unless (request.ssl? || request.local?)
        return true
    end
    before_filter :redirect_https

    def current_user
        # Search token gon variable
        @mybrand = Brand.first
        gon.algoliatoken = @mybrand.searchtoken

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
  
    def setup_mixpanel
        return unless current_user

            # For technical reasons, you need to do setup from a `mengpaneel.setup` block.
            # I'll go into those reasons later.
            mengpaneel.setup do
            mixpanel.identify(current_user.id)

            mixpanel.people.set(
                "ID"              => current_user.id,
                "$email"          => current_user.email,
                "$created"        => current_user.created_at
            )
        end
    end

end
