Rails.application.routes.draw do
  get "/root_recommendations", to: 'book_recommendations#by_teacher'

  resources :finished_books
  resources :book_recommendations do
    resources :comments
  end
  root to: 'welcome#index'
end