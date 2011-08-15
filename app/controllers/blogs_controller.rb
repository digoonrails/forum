class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end
  
  def show
    @blog = Blog.find params[:id]
  end
  
  def new
    @blog = Blog.new
  end  
    
  def edit
    @blog = Blog.find params[:id]
  end
  
  def create
    @blog = Blog.new(params[:blog])
    if @blog.save
      flash[:notice] = "Blog salvo com sucesso!"
      redirect_to :action => 'index'
    else
      flash.now[:error] = "Verifique se todos os campos foram preenchidos corretamente."
      render :action => 'new'
    end
  end
  
  def update
    @blog = Blog.find(params[:id])
    if @blog.update_attributes(params[:brand])
      flash[:notice] = "Blog alterado com sucesso!"
      redirect_to :action=>'index'
    else
      flash.now[:error] = "Verifique se todos os campos foram preenchidos corretamente."
      render :action => 'edit'  
    end
  end
  
  def destroy
    @blog = Blog.find(params[:id])
    if @blog.destroy
      flash[:notice] = "Blog deletado com sucesso!"
    else
      flash.now[:error] = "Verifique se o blog #{@blog.author} realmente pode ser deletada."
    end
    redirect_to :action => 'index'
  end
  
end