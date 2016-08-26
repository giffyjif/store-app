class ProductsController < ApplicationController
  before_action :authenticate_admin!, except: [:index, :show]

  def index
    @products = Product.all
    if params[:desc]
      @products = Product.order("#{params[:sort]}" => :desc)
    else
      @products = Product.order(params[:sort])
    end
    if params[:discount]
      @products = Product.where("price < ?", 2)
    end
    if params[:random]
      @products = Product.limit(1).order("RANDOM()")
    end
    if params[:category_id]
      selected_category = Category.find_by(id: params[:category_id])
      @products = selected_category.products
    end
    render 'products.html.erb'
  end

  def show
    @product = Product.find_by(id: params['id'])
    render 'show.html.erb'
  end

  def new
    @product = Product.new
    render 'new.html.erb'
  end

  def create
    @product = Product.new(
      name: params['name'],
      price: params['price'],
      description: params['description'],
      image: params[:image]
    )
    if @product.save
      flash[:success] = "Product successfully created!"
      redirect_to "/products/#{@product.id}"
    else
      render 'new.html.erb'
    end
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
      description: params['description'],
      image: params[:image]
    )
    if @product.save
      flash[:success] = "Product successfully updated!"
      redirect_to "/products/#{@product.id}"
    else
      render 'edit.html.erb'
    end
  end

  def destroy
    @product = Product.find_by(id: params['id'])
    @product.destroy
    redirect_to '/products'
  end

  def search
    @products = Product.where("name LIKE ?", "%#{params[search_terms]}%")
    render 'index.html.erb'
  end
end
