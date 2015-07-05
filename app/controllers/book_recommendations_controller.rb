class BookRecommendationsController < ApplicationController
  before_action :set_book_recommendation, only: [:show, :destroy]

  def index
    @book_recommendations = BookRecommendation.where(by_teacher: false)
  end

  def new
    @book_recommendation = BookRecommendation.new
    if current_user
      @book_recommendation.student = "Mrs. Root"
      @book_recommendation.by_teacher = true
    end
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

    if current_user
      @book_recommendation.by_teacher = params[:book_recommendation][:by_teacher]
    else
      @book_recommendation.by_teacher = false
    end

    if @book_recommendation.save
      flash[:success] = "Recommendation successfully created."
      redirect_to book_recommendations_path
    else
      render :new
    end
  end

  def destroy
    if current_user
      @book_recommendation.destroy
      flash[:success] = "Book recommendation was successfully destroyed."
    else
      flash[:error] = "You're not allowed to remove recommendations."
    end

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