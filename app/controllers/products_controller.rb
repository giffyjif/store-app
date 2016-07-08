class ProductsController < ApplicationController
  def all_products
    @products = Product.all
    render 'allproducts.html.erb'
  end
end
