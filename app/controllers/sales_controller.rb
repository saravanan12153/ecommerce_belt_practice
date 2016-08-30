class SalesController < ApplicationController
  def create
    @sale = Sale.new(product: Product.find(params[:product_id]), buyer: current_user)
    if @sale.valid?
      @sale.save
      redirect_to "/users/#{current_user.id}"
    else
      flash[:errors] = @sale.errors.full_messages
      redirect_to :back
    end
  end
end
