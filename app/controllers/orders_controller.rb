class OrdersController < ApplicationController
before_action :set_order, only: [:show, :edit, :update, :destroy]
#before_filter :authenticate_user!
load_and_authorize_resource
	
	def index 
		@order = Order.all
	end

	def show
		@order = Order.find(params[:id])
	end

	def new
		@order = Order.new
	end

	def edit
		
	end

	def create 
		@order = Order.new(order_params)
	end

	private
  
  def set_order
      @order = Order.find(params[:id])
    end
    
	def order_params
        params.require(:order).permit(:user_id, :product_id, :total)
    end
end