class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def create
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    current_user
    @user = User.find(params[:id])
  end

  def update
      @user = User.find(params[:id])

    if @user.update(user_params)
      flash[:notice] = "You have successfully updated your information"
      redirect_to "/users/#{@user.id}"
    else
      flash[:alert] = @user.errors.full_messages
      redirect_to "/users/#{@user.id}/edit"
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end
end
