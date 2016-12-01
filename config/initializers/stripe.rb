if Rails.env.production?
  Rails.configuration.stripe = {
    :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
    :secret_key => ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    :publishable_key => 'pk_test_k9gDUB35kpp4SLRsiucfbyeV',
    :secret_key => 'sk_test_zJroPJI5MGUzUeoxr6MvCAiO'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]

# reference it in app as Rails.configuration.stripe[:publishable_key]