class PaymentsController < ApplicationController

	Stripe.api_key = "sk_test_52yFIF5cD8nHTMERVrc0pZqs"

	def create
    token = params[:stripeToken]
    product = Product.find(params[:product_id])

  # Create the charge on Stripe's servers - this will charge the user's card
    begin
      charge = Stripe::Charge.create(
        :amount => product.price_in_cents, # amount in cents
        :currency => "usd",
        :source => token,
        :email => params[:email],
        :description => product.name,
    )

    order = Order.create(product_id: product, user_id: current_user, total: charge.amount)
    @email = params[:email]
    @message = "Thank for your order!"
    UserMailer.payment(@email, message).deliver
    #redirect_to order_url(order), notice: "You order has been processed"

    rescue Stripe::CardError => e
    # The card has been declined
      body = e.json_body
      err  = body[:error]
      flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"

      redirect_to product_path(product), notice: 'This card has been declined'
    end

  end
end
