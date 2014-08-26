require 'spec_helper'

describe OrdersController do
  describe "GET #new" do
    it "assigns a new order object to @order variable" do
      session[:user_id] = Fabricate(:user).id
      get :new
      expect(assigns(:order)).to be_instance_of(Order)
    end

    it "renders the new template" do
      session[:user_id] = Fabricate(:user).id
      get :new
      expect(response).to render_template('new')
    end
  end

  describe "POST #create" do
    it "saves the new order object" do
      session[:user_id] = Fabricate(:user).id
      post :create, order: Fabricate.attributes_for(:order)
      expect(Order.count).to eq(1)
    end

    it "sets the success flash message" do
      session[:user_id] = Fabricate(:user).id
      post :create, order: Fabricate.attributes_for(:order)
      expect(flash[:success]).to eq('Order has been created.')
    end

    # it "renders the show template" do
    #   get :show, id: order
    #   expect(response).to render_template('show')
    # end
  end

  # describe "GET #show" do
  #   let(:order) { Fabricate(:order) }
  #   it "finds the order with the given id and assigns to @order variable" do
  #     get :show, id: order
  #     expect(assigns(:order)).to eq(order)
  #   end
  #
  #   it "renders the show template" do
  #     get :show, id: order
  #     expect(response).to render_template('show')
  #   end
  # end

  # describe "DELETE #destroy" do
  #   let(:order) { Fabricate(:order) }
  #   it "finds the order with the given id and assigns to @order variable" do
  #     delete :destroy, id: order
  #     expect(assigns(:order)).to eq(order)
  #   end
  #
  #   it "sets order session to nil" do
  #     delete :destroy, id: order
  #     expect(session[:order_id]).to be_nil
  #   end
  #
  #   it "renders the show template" do
  #     delete :destroy, id: order
  #     expect(response).to redirect_to catalogs_path
  #   end
  # end

end
