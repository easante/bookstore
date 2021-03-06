class BooksController < ApplicationController
  before_action :require_signin
  before_action :require_admin
  before_action :set_book, except: [:index, :new, :create, :search]

  def index
    @books = Book.all
  end

  def show
  end

  def new
    @book = Book.new
    @book.publications.build
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:success] = 'Book has been created.'
      redirect_to @book
    else
      flash.now[:danger] = 'Book has not been created.'
      render :new
    end
  end

  def edit
  end

  def update
    if @book.update(book_params)
      flash[:success] = 'Book has been updated.'
      redirect_to @book
    else
      flash[:danger] = 'Book has not been updated.'
      render :edit
    end
  end

  def destroy
    if @book.destroy
      flash[:success] = 'Book has been deleted.'
      redirect_to books_path
    end
  end

  private
    def book_params
      params.require(:book).permit(:title, :isbn, :page_count, :price, :description,
                                   :published_at, :publisher_id, :book_cover,
                                   author_ids: [])
    end

    def set_book
      @book = Book.find(params[:id])
      #require 'pry'; binding.pry
    end
end
