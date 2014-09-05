require 'spec_helper'

describe SessionsController do
  before do
    @user = Fabricate(:user)
  end

  describe "GET new" do
    it "renders the new template for unauthenticated users" do

      get :new
      expect(response).to render_template :new
    end

    it "redirects to the home page for authenticated users" do
      session[:user_id] = @user.id
      get :new
      expect(response).to redirect_to root_path
    end
  end

  describe "POST create" do
    context "successful sign in" do
      before do
        post :create, { email: @user.email, password: @user.password }
      end

      it "redirects to root_path" do
        expect(response).to redirect_to root_path
      end

      it "sets the flash message" do
        expect(flash[:success]).to eq('Sign in successful.')
      end

      it "creates a session record for valid inputs" do
        expect(session[:user_id]).to eq(@user.id)
      end

    end

    context "unsuccessful sign in" do
      it "renders the sign in page" do
        post :create, email: @user.email, password: "mypassword"
        expect(response).to render_template :new
      end
    end
  end

  describe "GET destroy" do
    it "logs the user out" do
      session[:user_id] = @user.id
      get :destroy
      expect(session[:user_id]).to be_nil
    end

    it "redirects to the the root path" do
      get :destroy
      expect(response).to redirect_to root_path
    end
  end
end
