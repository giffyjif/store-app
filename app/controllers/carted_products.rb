class CartedProductsController < ApplicationController
  before_action :authenticate_user!
  def create
    carted_product = CartedProduct.create(
      user_id: params['user_id'],
      product_id: params['product_id'],
      quantity: params['quantity'],
      status: "Carted"
    )
    flash[:success] = "Product successfully added to cart"
    redirect_to '/checkout'
  end

  def index
    @carted_products = CartedProduct.find_by(user_id: params['user_id'])
    render 'index.html.erb'
  end

  # def destroy
  #   carted_product = CartedProduct.find_by(id: params['id'])
  #   carted_product.status = "Removed"
  #   carted_product.save
  #   flash[:success] = "Product removed!"
  #   session[:cart_count] = nil
  #   redirect_to '/cart'
  # end
end
