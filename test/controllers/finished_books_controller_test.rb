require 'test_helper'

class FinishedBooksControllerTest < ActionController::TestCase
  setup do
    @finished_book = finished_books(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:finished_books)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create finished_book" do
    assert_difference('FinishedBook.count') do
      post :create, finished_book: { author: @finished_book.author, central_idea: @finished_book.central_idea, student: @finished_book.student, title: @finished_book.title }
    end

    assert_redirected_to finished_book_path(assigns(:finished_book))
  end

  test "should show finished_book" do
    get :show, id: @finished_book
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @finished_book
    assert_response :success
  end

  test "should update finished_book" do
    patch :update, id: @finished_book, finished_book: { author: @finished_book.author, central_idea: @finished_book.central_idea, student: @finished_book.student, title: @finished_book.title }
    assert_redirected_to finished_book_path(assigns(:finished_book))
  end

  test "should destroy finished_book" do
    assert_difference('FinishedBook.count', -1) do
      delete :destroy, id: @finished_book
    end

    assert_redirected_to finished_books_path
  end
end
