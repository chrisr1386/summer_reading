class CommentsController < ApplicationController
  def new
    @book_recommendation = BookRecommendation.find(params[:book_recommendation_id])
    @comment = Comment.new(book_recommendation: @book_recommendation)
  end

  def create
    @book_recommendation = BookRecommendation.find(params[:book_recommendation_id])
    @comment = Comment.new(comment_params)

    if @comment.save
      flash[:success] = "Comment successfully saved."
      redirect_to book_recommendation_path(@book_recommendation)
    else
      render :new
    end
  end

  private

    def comment_params
      params.permit(:student, :body, :book_recommendation_id)
    end
end