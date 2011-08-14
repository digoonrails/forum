class SessionsController < ApplicationController
  def new
  end
  
  def create
    self.current_user = User.where( ["login = ? AND password = ?", params[:login], params[:password]] ).first
    if logged_in?
      flash[:notice] = "Login com sucesso."
      if params[:remember_me]=="1"
        cookies[:login_token] = { :value => "#{current_user.id};#{current_user.reset_login_key!}", :expires => Time.now.utc+1.year }
      end
      redirect_to root_url and return
    end
    flash.now[:notice] = "Login ou senha invalida, tente outra vez."
    render "new"
  end
  
  def destroy
    reset_session
    cookies.delete :login_token
    flash[:notice] = "desconectado"
    redirect_to root_url
  end
end
