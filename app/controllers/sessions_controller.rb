class SessionsController < ApplicationController
  
  layout "layout2"
   
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
       if current_user.admin
        redirect_to hub_url, notice: "Welcome Admin!"
       else 
        redirect_to hub_index, notice: "Logged in!"
       end
    else
      flash.now.alert = "Email or password is invalid"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to hub_url, notice: "Logged out!"
  end
end
