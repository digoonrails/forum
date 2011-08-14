class UsersController < ApplicationController
  before_filter :login_required,  :only => [:edit, :update, :destroy, :admin]
  before_filter :find_user,       :only => [:edit, :update, :destroy, :admin]

  respond_to :html

  def index
    @users = User.all
    respond_with @users
  end

  def show
    @user = User.find(params[:id])
    respond_with @user
  end

  # GET /users/new
  def new
    @user = User.new
    respond_with @user
  end
  
  def create
    @user = User.new(params[:user])
    @user.save
    respond_with @user
  end

  def edit
    @user = current_user unless admin?
  end

  def update
    @user = current_user unless admin?
    @user.update_attributes(params[:user])
    respond_with @user
  end

  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :ok }
    end
  end
  
  protected
    def find_user
      @user = params[:id] ? User.find(params[:id]) : current_user
    end
end
