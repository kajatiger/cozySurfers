class CommentsController < ApplicationController
	before_action :authenticate_user!

	def index
    @comments = Comment.paginate(:page => params[:page], :per_page => 5)
	end

	def show
	end

	def create
    @product = Product.find(params[:product_id])
		@comment = @product.comments.create!(params.require(:comment).permit!)
		@comment.user = current_user
  	@comment.save     
		redirect_to product_path(@product)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @product, notice: 'Review was created successfully.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { redirect_to @product, alert: 'Review was not saved successfully.' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
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