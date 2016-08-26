class Order < ActiveRecord::Base
  validates :user_id, presence: :true
  belongs_to :user
  has_many :carted_products
  has_many :products, through: :carted_products

  def calc_subtotal
    carted_products = CartedProduct.where(user_id: user_id, status: "Carted")
    subtotal = 0
    carted_products.each do |carted_product|
      subtotal += carted_product.quantity * carted_product.product.price
      carted_product.order_id = id
      carted_product.status = "Purchased"
      carted_product.save
    end
    subtotal
  end

  def calc_tax
    subtotal * 0.09
  end

  def calc_total
    subtotal + tax 
  end

  def product_names
    products.map do |product|
      product.name
    end
  end
end