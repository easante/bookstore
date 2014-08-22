require 'spec_helper'

describe CatalogController do

  describe "GET index" do
    let(:book1) { Fabricate(:book) }
    let(:book2) { Fabricate(:book) }

    it "lists all the books" do      
      get :index
      expect(assigns(:books)).to match_array([book1, book2])
    end

    it "renders the index template" do
      book = Fabricate(:book)
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET show" do
    it "displays a book details" do
      book = Fabricate(:book)
      get :show, id: book.id
      expect(assigns(:book)).to eq(book)
    end

    it "displays a catalog profile" do
      book = Fabricate(:book)
      get :show, id: book.id
      expect(response).to render_template :show
    end
  end

end
