class StaticPagesController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json

  def landing_page
     @products = Product.limit(3)    
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  def thank_you
  @name = params[:name]
  @email = params[:email]
  @message = params[:message]
  ActionMailer::Base.mail(:from => @email,
      :to => 'k.santro@posteo.de',
      :subject => "A new contact form message from #{@name}",
      :body => @message).deliver_now
  end


  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :description, :image_url, :color, :price)
    end
end

