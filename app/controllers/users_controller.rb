class UsersController < ApplicationController
before_action :require_login, except: [:create]
before_action :require_correct_user, except: [:create]

  def create
    @user = User.new(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], password: params[:password])
      if @user.valid?
          @user.save
          session[:user_id] = @user.id
          redirect_to "/users/#{current_user.id}"
      else
          flash[:errors] = @user.errors.full_messages
          redirect_to :back
      end
  end

  def show
    @user = current_user
    @own_products = current_user.products
    @purchases = current_user.purchases
  end

end
