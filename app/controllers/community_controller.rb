class CommunityController < ApplicationController
 def index
    @communities = Community.all
  end

  def create
      @community = Community.new(community_params)
    if @community.save
      @community.user_id = session[:user_id]
      flash[:notice] = "Post Created"
    else
      flash[:alert] = "ERROR POST NOT CREATED"
    end
    redirect_to "/community/index"
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
    params.require(:community).permit(:title, :text)
  end
end

