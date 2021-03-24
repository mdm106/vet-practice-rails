class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])
   if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to '/welcome'
   else
    redirect_to '/login', notice: "Invalid email or password"
   end
  end

  def login
  end

  def destroy
    session.delete(:user_id)
    @current_user = nil
    redirect_to '/'
  end

  def welcome
  end
end
