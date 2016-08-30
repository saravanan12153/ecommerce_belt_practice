class SessionsController < ApplicationController
  def new
    if current_user
    redirect_to "/users/#{current_user.id}"
    end
  end

  def create
  user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to "/users/#{current_user.id}"
    else
      flash[:errors] = ["Invalid combination"]
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
