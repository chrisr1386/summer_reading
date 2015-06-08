class BookRecommendationsController < ApplicationController
  before_action :set_book_recommendation, only: [:show, :destroy]

  def index
    @book_recommendations = BookRecommendation.where(by_teacher: false)
  end

  def new
    @book_recommendation = BookRecommendation.new
  end

  def show
    if @book_recommendation.by_teacher?
      @book_recommendations = BookRecommendation.where(by_teacher: true)
    else
      @book_recommendations = BookRecommendation.where(by_teacher: false)
    end
  end

  def create
    @book_recommendation = BookRecommendation.new(book_recommendation_params)
    @book_recommendation.by_teacher = false

    if @book_recommendation.save
      flash[:success] = "Recommendation successfully created."
      redirect_to book_recommendations_path
    else
      render :new
    end
  end

  def destroy
    @book_recommendation.destroy
    flash[:success] = "Book recommendation was successfully destroyed."
    redirect_to book_recommendations_path
  end

  def by_teacher
    @book_recommendations = BookRecommendation.where(by_teacher: true)
  end

  private

    def set_book_recommendation
      @book_recommendation = BookRecommendation.eager_load(:comments).find(params[:id])
    end

    def book_recommendation_params
      params.require(:book_recommendation).permit(:title, :author, :student, :description)
    end

end