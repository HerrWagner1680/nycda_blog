class CommunitiesController < ApplicationController
  def index
    @communities = Community.all
    @comment = Comment.new
    @post = Post.new
    @comments = Comment.all
  end

  def create
    @community = Community.new(community_params)
    @community.user_id = session[:user_id]    
    if @community.save
      flash[:notice] = "Post Created"
    else
      flash[:alert] = "ERROR POST NOT CREATED"
    end
    redirect_to "/communities"
  end

  def new
    @community = Community.new
  end

  def edit
    @community = Community.find(params[:id])
  end

  def show
    @community = Community.find(params[:id])
    @current_user = User.find(session[:user_id])
    @post_new = Post.new
  end

  def update
    @community = Community.find(params[:id])
    if @community.update(params[:post])
      flash[:notice] = "Post updated"
    else
      flash[:alert] = "Error Updating Post"
    end
    redirect_to "/posts"
  end

  def destroy
    @community = Community.find(params[:id])
    if @community.destroy
      flash[:notice] = "Post was thrown out"
    else
      flash[:alert] = "Post was not destroyed"
    end
    redirect_to "/posts"
  end

  private

    def community_params
      params.require(:community).permit(:title, :text, :user_id)
    end
end

