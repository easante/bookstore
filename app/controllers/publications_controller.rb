class PublicationsController < ApplicationController
  def new
    @book = Book.new
    publication = @book.publications.build
    render partial: 'publication', locals: { pub: publication }
  end

end
