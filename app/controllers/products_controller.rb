class ProductsController < ApplicationController
  def index
    @products = Product.all
    render 'products.html.erb'
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

  def show
    @product = Product.find_by(id: params['id'])
    render 'show.html.erb'
  end

  def new
    render 'new.html.erb'
  end

  def create
    product = Product.create(
      name: params['name'],
      price: params['price'],
      description: params['description']
    )
    flash[:success] = "Product successfully created"
    redirect_to '/products'
  end

  def edit
    @product = Product.find_by(id: params['id'])
    render 'edit.html.erb'
  end

  def update
    @product = Product.find_by(id: params['id'])
    @product.update(
      name: params['name'],
      price: params['price'],
      description: params['description']
    )
    redirect_to "/products/#{@product.id}"
  end

  def destroy
    @product = Product.find_by(id: params['id'])
    @product.destroy
    redirect_to '/products'
  end
end
