class UsersController < ApplicationController
  def index
    @user = Users.all
  end

  def create
  end

  def new
    @user = Users.new
  end

  def edit
    @user = Users.find(params[:id])
  end

  def show
    current_user
    @user = Users.find(params[:id])
  end

  def update
      @user = Users.find(params[:id])

    if @user.update(user_params)
      flash[:notice] = "You have successfully updated your information"
      redirect_to "/users/#{@user.id}"
    else
      flash[:alert] = @user.errors.full_messages
      redirect_to "/users/#{@user.id}/edit"
    end
  end

  def destroy
    @user = Users.find(params[:id])
    @user.destroy
  end
end
