class CatalogsController < ApplicationController
  before_action :set_cart

  def index
    @books = Book.all.page(params[:page]).per(5)
#    reset_session
  end

  def show
    @book = Book.find(params[:id])
  end

  def search
    #require 'pry';binding.pry
    @books = Book.search_by_title(params[:search_word])
  end

end
