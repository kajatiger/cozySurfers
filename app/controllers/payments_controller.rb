class PaymentsController < ApplicationController
 def create
   @product  = Product.find(params[:id])
   @user     = current_user
   token = params[:stripeToken]
   # Create the charge on Stripe's servers - this will charge the user's card
   charge = Stripe::Charge.create(
     :amount => @product.price, # amount in cents, again
     :currency => "eur",
     :source => token,
     :description => params[:stripeEmail]
   )

   if charge.paid
     Order.create!(product_id: @product.id, user_id: @user.id, total: @product.price)
   end

   dispute = Stripe::Dispute.retrieve("dp_17sGETLpSdVJN1iVw8BHvseP")
   dispute.evidence = {
     :customer_email_address => @user.email,
     :shipping_date => Date.today ,
     :shipping_documentation => @order.details
   }
   dispute.save

   redirect_to product_path(product)

   rescue Stripe::CardError => e
     body = e.json_body
     err = body[:error]
     flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
       # The card has been declined #payments_create_path
 end
end
