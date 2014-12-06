class CommentsController < ApplicationController
  def index
    @comments = Comments.all
  end

  def create
      @comment = Comments.new(comment_params)
      @comment.user_id = session[:user_id]
    if @comment.save
      flash[:notice] = "Comment was created"
      redirect_to "/posts"
    else
      flash[:alert] = @comment.errors.full_messages
      redirect_to "/posts"
  end

  def new
    @comment = Comments.new
  end



  def show
    @comment = Comments.find(params[:id])
  end


  def destroy
    @comment = Comments.find(params[:id])
    @comment.destroy
    redirect_to "/posts"
  end
end
end
