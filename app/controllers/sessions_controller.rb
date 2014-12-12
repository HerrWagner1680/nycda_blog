class SessionsController < ApplicationController
  def create
    @user = User.where(email: params[:email]).first
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      cookies[:user_id] = @user.id
      flash[:notice] = "You are now logged in"
      redirect_to "/users"
    else
      flash[:alert] = ["Incorrect values"]
      redirect_to "/"
    end
  end

  def new
    @post = Post.new
  end

  def destroy
    session[:user_id] = nil
    if request.xhr?
      render :js => "window.location = '/'"
    else
      redirect_to "/"
    end
  end

  private

  def sessions_params
    params.require(:user).permit(:email,:password)
  end
end
