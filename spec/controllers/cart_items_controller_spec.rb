require 'spec_helper'

describe CartItemsController do

  describe "POST #create" do
    context "a successful create" do
      let(:book) { Fabricate(:book) }
      it "saves the new cart_item object" do
#        book = Fabricate(:book)
#        require 'pry';binding.pry
        post :create, cart_item: Fabricate.attributes_for(:cart_item,
                                            book_id: book.id), book_id: book.id
        expect(CartItem.count).to eq(1)
      end

      it "redirects to the cart show action" do
        post :create, cart_item: Fabricate.attributes_for(:cart_item), book_id: book.id
        expect(response).to redirect_to cart_path(Cart.first.id)
      end

      it "sets the success flash message" do
        post :create, cart_item: Fabricate.attributes_for(:cart_item), book_id: book.id
        expect(flash[:success]).to eq('Cart item has been created.')
      end
    end

    # context "unsuccessful create" do
    #   it "it does not save the new cart_item object with invalid inputs" do
    #     post :create, cart_item: Fabricate.attributes_for(:cart_item, title: nil)
    #     expect(CartItem.count).to eq(0)
    #   end
    #
    #   it "renders to the new template" do
    #     post :create, cart_item: Fabricate.attributes_for(:cart_item, title: nil)
    #     expect(response).to render_template :new
    #   end
    #
    #   it "sets the failure flash message" do
    #     post :create, cart_item: Fabricate.attributes_for(:cart_item, title: nil)
    #     expect(flash[:danger]).to eq('CartItem has not been created.')
    #   end
    # end
  end

end
