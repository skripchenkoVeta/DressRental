# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    if params[:product_id]
      @product = Product.find(params[:product_id])
      @comment = @product.comments.new(comment_params)
    else
      @salon = Salon.find(params[:salon_id])
      @comment = @salon.comments.new(comment_params)
    end
    authorize @comment
    @comment.user_id = current_user.id
    if @comment.save
      return redirect_to product_path(@product) if @comment.commentable_type == 'Product'
      redirect_to salon_path(@salon)
    else
      redirect_to new_user_session_path
    end
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :message, :commentable_id, :commentable_type)
  end
end
