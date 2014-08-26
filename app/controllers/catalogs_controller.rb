class CatalogsController < ApplicationController
  before_action :set_cart

  def index
    @books = Book.all
#    reset_session
  end

  def show
    @book = Book.find(params[:id])
  end
end
