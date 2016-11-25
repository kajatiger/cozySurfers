class CommentsController < ApplicationController
	before_action :authenticate_user!

	def index
	end

	def show
	end

	def create
    @product = Product.find(params[:product_id])
		@comment = @product.comments.create!(params.require(:comment).permit!)
		@comment.user = current_user
  	@comment.save     
		redirect_to product_path(@product)
  end

	def destroy
    @product = Product.find(params[:product_id])
    @comment = @product.comments.find(params[:id])
    @comment.destroy
    redirect_to product_path(@product)
  end




  private

  def comment_params
    params.require(:comment).permit(:user_id, :body, :rating)
  end

end
