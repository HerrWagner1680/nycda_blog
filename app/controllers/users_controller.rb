class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Successfully Registered"
      redirect_to "/users/#{ @user.id }"
    else
      flash[:alert] = @users.errors.full_messages
      redirect_to "/users/new"
    end
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def contact
    User
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

  def community_create
    @post = Post.new(post_params)
    if @post.save
      @post.user_id = session[:user_id]
      flash[:notice] = "Post Created"
    else
      flash[:alert] = "ERROR POST NOT CREATED"
    end
    redirect_to "/posts"
  end

  def community_new
  end

private

  def user_params
    params.require(:user).permit(:email,:password,:fname,:lname, :avatar)
  end

end
