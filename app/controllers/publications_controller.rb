class PublicationsController < ApplicationController
  def new
    @book = Book.new
    3.times { @book.publications.build }
    #publication = 3.times { @book.publications.build }
    #render partial: 'publication' #, locals: { pub: publication }
  end

end
