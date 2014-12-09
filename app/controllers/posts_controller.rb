class PostsController < ApplicationController
  def index
    @posts = Post.all
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = "Post Created"
    else
      flash[:alert] = @post.errors.full_messages
    end
    redirect_to "/posts"
  end

  def new
    @post = Post.new
    @post_new = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def show
    @post = Post.find(params[:id])
    @current_user = User.find(session[:user_id])
    @post_new = Post.new
  end

  def update
      @post = Post.find(params[:id])
    if @post.update(params[:post])
      flash[:notice] = "Post updated"
    else
      flash[:alert] = "Error Updating Post"
    end

    redirect_to "/posts"
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:notice] = "Post was thrown out"
    else
      flash[:alert] = "Post was not destroyed"
    end
    redirect_to "/posts"
  end

private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
