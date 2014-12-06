class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def create
      @comment = Comment.new(comment_params)
      @comment.user_id = session[:user_id]
    if @comment.save
      flash[:notice] = "Comment was created"
      redirect_to "/posts"
    else
      flash[:alert] = @comment.errors.full_messages
      redirect_to "/posts"
  end

  def new
    @comment = Comment.new
  end



  def show
    @comment = Comment.find(params[:id])
  end


  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to "/posts"
  end
end
end
