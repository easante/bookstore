class UsersController < ApplicationController
  before_action :set_user, except: [:index, :new, :create]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'User has been created.'
      if session[:intended_destination]
        session[:user_id] = @user.id
        redirect_to session[:intended_destination]
        session[:intended_destination] = nil
      else
        redirect_to @user
      end
    else
      flash[:danger] = 'User has not been created.'
      render :new
    end
  end

  # def edit
  # end
  #
  # def update
  #   if @user.update(user_params)
  #     flash[:success] = 'User has been updated.'
  #     redirect_to @user
  #   else
  #     flash[:danger] = 'User has not been updated.'
  #     render :edit
  #   end
  # end
  #
  # def destroy
  #   if @user.destroy
  #     flash[:success] = 'User has been deleted.'
  #     redirect_to users_path
  #   end
  # end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password,
                                   :password_confirmation, :address, :city,
                                   :postal_code)
    end

    def set_user
      @user = User.find(params[:id])
    end
end
