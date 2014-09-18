require 'spec_helper'

describe Admin::UsersController do
  let!(:user) { Fabricate(:user) }
  let!(:admin) { Fabricate(:admin) }

  describe "GET #new" do
    before do
      # set_current_user
    end

    context "unauthenticated users" do
      it "redirects to the sign in page" do
        get :new
        expect(response).to redirect_to signin_path
      end
    end

    context "non-admin users" do
      it "redirects to the sign in page" do
        session[:user_id] = user.id

        get :new
        expect(flash[:danger]).to be_present
      end
    end

    context "admin users" do
      before do
        session[:user_id] = admin.id
      end

      it "assigns a new user to @user" do
        get :new
        expect(assigns(:user)).to be_a_new(User)
      end

      it "renders the new template" do
        get :new
        expect(response).to render_template :new
      end
    end
  end

  describe "GET #show" do
    context "unauthenticated users" do
      it "redirects to the sign in page" do
        get :show, id: user.id
        expect(response).to redirect_to signin_path
      end

      it "displays a flash danger message" do
        get :show, id: user.id
        expect(flash[:danger]).to be_present
      end
    end

    context "non-admin users" do
      before do
        session[:user_id] = user.id
      end

      it "redirects to the sign in page" do
        session[:user_id] = user.id
        get :show, id: user.id
        expect(response).to redirect_to root_path
      end

      it "displays a flash danger message" do
        get :show, id: user.id
        expect(flash[:danger]).to be_present
      end
    end

    context "admin users" do
      before do
        session[:user_id] = admin.id
      end

      it "displays a user profile" do
        get :show, id: admin.id
        expect(assigns(:user)).to eq(admin)
      end

      it "displays a user profile" do
        get :show, id: admin.id
        expect(response).to render_template :show
      end
    end
  end

  describe "POST #create" do
    context "unauthenticated users" do
      it "redirects to the sign in page" do
        post :create, user: Fabricate.attributes_for(:user)
        expect(response).to redirect_to signin_path
      end

      it "displays a flash danger message" do
        post :create, user: Fabricate.attributes_for(:user)
        expect(flash[:danger]).to be_present
      end
    end

    context "non-admin users" do
      before do
        session[:user_id] = user.id
      end

      it "redirects to the home page" do
        post :create, user: Fabricate.attributes_for(:user)
        expect(response).to redirect_to root_path
      end

      it "displays a flash danger message" do
        post :create, user: Fabricate.attributes_for(:user)
        expect(flash[:danger]).to be_present
      end
    end

    context "admin users" do
      before do
        session[:user_id] = admin.id
      end

      context "successful user creation" do
        it "redirects to the user show path" do
          post :create, user: Fabricate.attributes_for(:user)
          expect(response).to redirect_to admin_user_path(User.last)
        end
      end

      context "unsuccessful user creation" do
        it "renders the new template when invalid user data are entered" do
          post :create, user: Fabricate.attributes_for(:user, first_name: "")
          expect(response).to render_template :new
        end

        it "sets the flash error message" do
          post :create, user: Fabricate.attributes_for(:user, first_name: "")
          expect(flash[:danger]).to be_present
        end
      end
    end
  end

  describe "GET #index" do
    context "unauthenticated users" do
      it "redirects to the sign in page" do
        get :index
        expect(response).to redirect_to signin_path
      end
    end

    context "non-admin users" do
      it "redirects to the sign in page" do
        session[:user_id] = user.id

        get :index
        expect(flash[:danger]).to be_present
      end
    end

    context "admin users" do
      before do
        session[:user_id] = admin.id
      end

      it "assigns an array of all users to @users" do
        get :index
        expect(assigns(:users)).to match_array [user, admin]
      end

      it "renders the index template" do
        get :index
        expect(response).to render_template :index
      end
    end
  end

  describe "GET #edit" do
    context "unauthenticated users" do
      it "redirects to the sign in page" do
        get :edit, id: user.id
        expect(response).to redirect_to signin_path
      end
    end

    context "non-admin users" do
      it "redirects to the sign in page" do
        session[:user_id] = user.id

        get :edit, id: user.id
        expect(flash[:danger]).to be_present
      end
    end

    context "admin users" do
      before do
        session[:user_id] = admin.id
      end

      it "assigns the given user to @user" do
        get :edit, id: user.id
        expect(assigns(:user)).to eq(user)
      end

      it "renders the edit template" do
        get :edit, id: user.id
        expect(response).to render_template :edit
      end
    end
  end

  describe "PUT #update" do
    context "unauthenticated users" do
      it "redirects to the sign in page" do
        put :update, user: Fabricate.attributes_for(:user, first_name: 'John'), id: user.id
        expect(response).to redirect_to signin_path
      end

      it "displays a flash danger message" do
        put :update, user: Fabricate.attributes_for(:user, first_name: 'John'), id: user.id
        expect(flash[:danger]).to be_present
      end
    end

    context "non-admin users" do
      before do
        session[:user_id] = user.id
      end

      it "redirects to the home page" do
        put :update, user: Fabricate.attributes_for(:user, first_name: 'John'), id: user.id
        expect(response).to redirect_to root_path
      end

      it "displays a flash danger message" do
        put :update, user: Fabricate.attributes_for(:user, first_name: 'John'), id: user.id
        expect(flash[:danger]).to be_present
      end
    end

    context "admin users" do
      before do
        session[:user_id] = admin.id
      end

      context "successful user update" do
        it "redirects to the user show path" do
          put :update, user: Fabricate.attributes_for(:user, first_name: 'John'), id: user.id
          expect(response).to redirect_to admin_user_path(user)
        end
      end

      context "unsuccessful user update" do
        it "renders the edit template when invalid user data are entered" do
          put :update, user: Fabricate.attributes_for(:user, first_name: ''), id: user.id
          expect(response).to render_template :edit
        end

        it "sets the flash error message" do
          put :update, user: Fabricate.attributes_for(:user, first_name: ''), id: user.id
          expect(flash[:danger]).to be_present
        end
      end
    end
  end

  describe "DELETE #destroy" do
    context "unauthenticated users" do
      it "redirects to the sign in page" do
        delete :destroy, id: user.id
        expect(response).to redirect_to signin_path
      end

      it "displays a flash danger message" do
        delete :destroy, id: user.id
        expect(flash[:danger]).to be_present
      end
    end

    context "non-admin users" do
      before do
        session[:user_id] = user.id
      end

      it "redirects to the home page" do
        delete :destroy, id: user.id
        expect(response).to redirect_to root_path
      end

      it "displays a flash danger message" do
        delete :destroy, id: user.id
        expect(flash[:danger]).to be_present
      end
    end

    context "admin users" do
      before do
        session[:user_id] = admin.id
      end

      context "successful user destroy" do
        it "redirects to the user index path" do
          delete :destroy, id: user.id
          expect(response).to redirect_to admin_users_path
        end
      end
    end
  end
end
