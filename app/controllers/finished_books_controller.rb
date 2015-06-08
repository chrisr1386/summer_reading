class FinishedBooksController < ApplicationController
  before_action :set_finished_book, only: [:show, :edit, :update, :destroy]

  def index
    @finished_books = FinishedBook.all
  end

  def show
  end

  def new
    @finished_book = FinishedBook.new
  end

  def edit
  end

  def create
    @finished_book = FinishedBook.new(finished_book_params)

    if @finished_book.save
      flash[:success] = 'Finished book was successfully created.'
      redirect_to finished_books_path
    else
      render :new
    end
  end

  def update
    if @finished_book.update(finished_book_params)
      redirect_to finished_books_path, notice: 'Finished book was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @finished_book.destroy
    flash[:success] = 'Finished book was successfully destroyed.'
    redirect_to finished_books_path
  end

  private

    def set_finished_book
      @finished_book = FinishedBook.find(params[:id])
    end

    def finished_book_params
      params.require(:finished_book).permit(:title, :author, :student, :central_idea, :genre)
    end
end
