class OrdersController < ApplicationController
  def create
    cart = CartedProduct.where(user_id: current_user.id, status: "Carted")
    @order = Order.create(user_id: current_user.id)
    @order.subtotal = @order.calc_subtotal
    @order.tax = @order.calc_tax
    @order.total = @order.calc_total
    @order.save
    #   subtotal = params['quantity'].to_i * product.price
    #   tax = params['quantity'].to_i * product.price * 0.09
    #   subtotal: subtotal,
    #   tax: tax,
    #   total: subtotal + tax,
    #   cart_id: params['order_id'],
    # )
    redirect_to "/orders/#{@order.id}"
  end

  # def update
  #   order = Order.update(
  #     subtotal: order.subtotal,
  #     tax: order.tax,
  #     total: order.total
  #   )
  # end

  def show
    @order = Order.find_by(id: params['id'])
    render 'show.html.erb'
  end
end
