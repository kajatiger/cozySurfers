class PaymentsController < ApplicationController
 def create
   @product  = Product.find(params[:product_id])
   @user     = current_user
   token = params[:stripeToken]
   # Create the charge on Stripe's servers - this will charge the user's card
   charge = Stripe::Charge.create(
     :amount => (@product.price * 100).to_i, # amount in cents, again
     :currency => "eur",
     :source => token,
     :description => params[:stripeEmail]
   )

   if charge.paid
     order = Order.create!(product_id: @product.id, user_id: @user.id, total: @product.price)
     redirect_to order_path(order)
   end

   rescue Stripe::CardError => e
     body = e.json_body
     err = body[:error]
     flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
       # The card has been declined #payments_create_path
 end
end


