class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def create
      @post = Post.new(title: params[:post][:title],
                     text: params[:post][:text],
                     user_id: session[:user_id])
    if @post.save
      flash[:notice] = "Post Created"
    else
      flash[:alert] = "ERROR POST NOT CREATED"
    end

    redirect_to "/posts"
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id]
  end

  def show
    @post = Post.find(params[:id])
    @current_user = User.find(session[:user_id])
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
end
