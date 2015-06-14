class OrdersController < ApplicationController
before_action :set_order, only: [:show, :edit, :update, :destroy]
#before_filter :authenticate_user!
load_and_authorize_resource
	
	def index 
		
	end

	def show
		@order = Order.find(params[:id])
	end

	def new
		@order = Order.new
	end

	def edit
		@order = Order.find(params[:id])
	end

	def create 
		@order = Order.new(order_params)
	end

end