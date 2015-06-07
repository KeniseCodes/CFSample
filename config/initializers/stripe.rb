if Rails.env.production?
  Rails.configuration.stripe = {
    :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
    :secret_key      => ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    :publishable_key => 'pk_test_U6okaKwsL3Rg5Naz0InKq5nE',
    :secret_key      => 'sk_test_52yFIF5cD8nHTMERVrc0pZqs'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]