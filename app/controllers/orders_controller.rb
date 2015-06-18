class OrdersController < ApplicationController
before_action :set_order, only: [:show, :edit, :update, :destroy]
#before_filter :authenticate_user!
load_and_authorize_resource
	
	def index 
		@order = Order.all
	end

	def show
		@orders = @current_user.orders.find(params[:id])
	end

	def new
		@order = Order.new
	end

	def edit
		
	end

	def create 
		@product = Product.find(params[:product_id])
		@order = Order.new(order_params)
		@order.user = current_user
	end

	private
  
  def set_order
      @order = Order.find(params[:id])
    end

	def order_params
        params.require(:order).permit(:user_id, :product_id, :total)
    end
end