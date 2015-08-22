class PaymentsController < ApplicationController

	Stripe.api_key = "sk_test_52yFIF5cD8nHTMERVrc0pZqs"

	def create
    token = params[:stripeToken]
    @product = Product.find(params[:product_id])
    @email = params[:stripeEmail]
    @user = current_user

  # Create the charge on Stripe's servers - this will charge the user's card
    begin
      charge = Stripe::Charge.create(
        :amount => (@product.price * 100).to_i, # amount in cents
        :currency => "USD",
        :source => token,
        :email => params[:email],
        :description => @product.name,
    )

    @order = Order.create!(product: @product, user: @user, total: charge.amount)
    
    UserMailer.payment(@email, @product).deliver
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
