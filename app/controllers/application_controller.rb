class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # before_action :calculate_cart_count

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authenticate_user!
    flash[:warning] = "Must be logged in to complete this action!"
    redirect_to '/products' unless current_user
  end

  def authenticate_admin!
    redirect_to '/products' unless current_user && current_user.admin
  end

  # def calculate_cart_count
  #   if current_user
  #     if session[:cart_count]
  #       @cart_count = session[:cart_count]
  #     else
  #       @cart_count = current_user.carted_products.where(status: 'Carted').count
  #       session[:cart_count] = @cart_count
  #     end
  #   else
  #     @cart_count = 0
  #   end
  # end
end
