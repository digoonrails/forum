class SessionsController < ApplicationController
  def new
  end
  
  def destroy
    reset_session
    cookies.delete :login_token
    flash[:notice] = "desconectado"
    redirect_to root_url
  end
end
