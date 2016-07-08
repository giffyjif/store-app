class ProductsController < ApplicationController
  def all_products
    @products = Product.all
    render 'allproducts.html.erb'
  end

  def apple_jacks
    @apple_jacks = Product.first
    render 'applejacks.html.erb'
  end

  def froot_loops
    @froot_loops = Product.second
    render 'frootloops.html.erb'
  end

  def lucky_charms
    @lucky_charms = Product.third
    render 'luckycharms.html.erb'
  end
end
