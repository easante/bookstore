require 'spec_helper'

describe CartItemsController do

  describe "POST #create" do
    context "a successful create" do
      let!(:book) { Fabricate(:book) }
      let(:cart) { Fabricate(:cart) }

      it "saves the new cart_item object" do
        session[:cart_id] = cart.id

        post :create, cart_item: Fabricate.attributes_for(:cart_item,
                                 cart: cart, book: book), book_id: book.id
        expect(CartItem.count).to eq(1)
      end

      it "redirects to the cart show action" do
        session[:cart_id] = cart.id

        # require 'pry';binding.pry
        post :create, cart_item: Fabricate.attributes_for(:cart_item,
                                 cart: cart, book: book), book_id: book.id
        expect(response).to redirect_to root_path
        # expect(response).to redirect_to cart_path(Cart.first.id)
      end

      it "sets the success flash message" do
        # post :create, cart_item: Fabricate.attributes_for(:cart_item), book_id: book.id
        # expect(flash[:success]).to eq('Cart item has been created.')
      end
    end

#     context "unsuccessful create" do
#       let!(:book) { Fabricate(:book) }
#       let(:cart) { Fabricate(:cart) }
#
#       it "does not save the new cart_item object" do
#         session[:cart_id] = cart.id
# #require 'pry';binding.pry
#         post :create, cart_item: Fabricate.attributes_for(:cart_item, book: book), book_id: book.id
#         expect(CartItem.count).to eq(0)
#       end
#
#       it "renders the new template" do
#         session[:cart_id] = cart.id
#
#         # require 'pry';binding.pry
#         post :create, cart_item: Fabricate.attributes_for(:cart_item, book: book), book_id: book.id
#         expect(response).to render_template('new')
#       end
#
#       it "sets the error flash message" do
#         post :create, cart_item: Fabricate.attributes_for(:cart_item, book: book), book_id: book.id
#         expect(flash[:danger]).to eq('Cart item has not been created.')
#       end
#     end
  end

end
