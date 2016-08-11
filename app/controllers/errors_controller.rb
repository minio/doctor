class ErrorsController < ApplicationController
  def not_found
    mixpanel.track("404 Not Found")  
    render(:status => 404)
  end

  def internal_server_error
    mixpanel.track("Internal Server Error")  
    render(:status => 500)
  end
end
