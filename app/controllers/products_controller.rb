class ProductsController < ApplicationController
  def show
    @products = Product.all
  end

  def destroy
    @product_to_destroy = Product.find_by(id: params[:product])
    @product_to_destroy.delete
    redirect_to :back
  end

  def create
    @product = Product.new(seller: current_user, name: params[:name], price: params[:price])
      if @product.valid?
        @product.save
        redirect_to :back
      else
        flash[:errors] = @product.errors.full_messages
        redirect_to :back
      end
  end
end
