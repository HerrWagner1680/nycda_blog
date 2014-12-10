class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  # def create
  #     @comment = Comment.new(comment_params)
  #     @comment.user_id = session[:user_id]
  #   if @comment.save && @comment.community_id = nil
  #     flash[:notice] = "Comment was created"
  #     redirect_to "/posts"
  #   elsif @comment.save && @comment.post_id = nil
  #     flash[:notice] = "Comment was created"
  #     redirect_to "/communities"

  #   elsif @comment.community_id = nil
  #     flash[:alert] = @comment.errors.full_messages
  #     redirect_to "/posts"

  #   else
  #     flash[:alert] = @comment.errors.full_messages
  #     redirect_to "/communities"
  #   end
  # end

  def create
      @comment = Comment.new(comment_params)
      @comment.user_id = session[:user_id]

    if @comment.save && @comment.post_id
      flash[:notice] = "Comment was created"
      redirect_to "/posts"

    elsif @comment.save && @comment.community_id
      flash[:notice] = "Comment was created"
      redirect_to "/communities"

    else
      flash[:alert] = @comment.errors.full_messages

    end
  end




  def new
    @comment = Comment.new
  end


  def show
    @comment = Comment.find(params[:id])
    @post_new = Post.new
  end


  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to "/posts"
  end

private

  def comment_params
    params.require(:comment).permit(:text, :post_id, :community_id)
  end

end
