class SessionsController < ApplicationController

  def create
    @user = User.where(email: params[:email]).first

    if @user && @user.password_digest == params[:password_digest]
      session[:user_id] = @user.id
      flash[:notice] = "You are now logged in"
      redirect_to "/users"
    else
      flash[:alert] = ["Incorrect values"]
      redirect_to "/sessions/new"
    end
  end

  def new
  end

  def destroy
    session[:user_id] = nil
    redirect_to "/"
  end

  private

  def sessions_params
    params.require(:user).permit(:email,:password_digest)
  end
end
