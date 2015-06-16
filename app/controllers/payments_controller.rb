class PaymentsController < ApplicationController

	Stripe.api_key = "sk_test_52yFIF5cD8nHTMERVrc0pZqs"

	def create
    token = params[:stripeToken]
    product = Product.find(params[:product_id]) rescue nil

  # Create the charge on Stripe's servers - this will charge the user's card
    begin
      charge = Stripe::Charge.create(
        :amount => 40000, # amount in cents
        :currency => "usd",
        :source => token,
        :description => params[:stripeEmail]
    )

    order = Order.create(user_id: user.id, product_id: product.id, total: order.total)
    redirect_to order_url(order), notice: "You order has been processed"

    rescue Stripe::CardError => e
    # The card has been declined
      body = e.json_body
      err  = body[:error]
      flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
    end
  	redirect_to product_path(product)
  end
end
