class ProductsController < ApplicationController
  def destroy
    @product = Product.where(:id => params[:id]).first
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end
  def update
    @product = Product.where(:id => params[:id]).first
    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to @product, :notice => 'Product was succesfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit"}
        format.json { render json: @product.errors, :status => :unprocessable_entity }
      end
    end
  end
  def edit
    @product = Product.where(:id => params[:id]).first
  end
  def show
    @product = Product.where(:id => params[:id]).first
  end
  def new
    @product = Product.new
  end
  def index
    @products = Product.includes(:user).all
    respond_to do |format|
      format.html
      format.json {render :json => @products}
    end
  end
  def create
    @product = Product.new(params[:product])

    respond_to do |format|
      if @product.save
        format.html {render :action => 'create'}
        format.json {render :json => @product}
      else
        format.html {render :action => 'new'}
        format.json {render :json => @product.errors, :status => :unprocessable_entity}
      end
    end
  end
end
