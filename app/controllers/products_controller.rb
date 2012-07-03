class ProductsController < ApplicationController
	def index

		@products = Product.includes(:user).all
		
	end

	def create
  @product = Product.new(params[:product])

  respond_to do |format|
    if @product.save
      format.html { render :action => "create" }
      format.json { render :json => @product }
    else
      format.html { render :action => "new" }
      format.json { render :json => @product.errors, :status => :unprocessable_entity }
    end
  end
end

def new
  @product = Product.new
end

end
