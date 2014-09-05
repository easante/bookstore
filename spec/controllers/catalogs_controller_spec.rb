require 'spec_helper'

describe CatalogsController do

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

  describe "POST search" do
    it "returns an array of books that match the search string" do
      rails3 = Fabricate(:book, title: 'Rails 3 in Action')

      post :search, search_word: 'Rails'
      expect(assigns(:books)).to eq [rails3]
    end

    it "renders the search template" do
      rails3 = Fabricate(:book, title: 'Rails 3 in Action')

      post :search, search_word: 'Rails'
      expect(response).to render_template('search')
    end
  end

end
