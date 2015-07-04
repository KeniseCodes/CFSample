class OrdersController < ApplicationController
before_action only: [:show, :edit, :update, :destroy]
#before_filter :authenticate_user!
load_and_authorize_resource
	
	def index 
		@order = Order.all
	end

	def show
		@order = Order.find_by_id(params[:id]) #rescue nil	
	end

	def new
		@order = Order.new
	end

	def edit
		
	end

	def create 
	#3@product = Product.find(params[:product_id])
	 # @user = current_user
		#@order = Order.new(params[:order])
		#@order.save
	end

	private
  
  #def set_order
  #	@order = Order.find(params[:id])
   # end

	def order_params
        params.require(:order).permit(:user_id, :product_id, :total)
    end
end