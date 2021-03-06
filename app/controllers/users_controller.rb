class UsersController < ApplicationController
  def index
    @user = User.all
    @posts = Post.all
    @post = Post.new
    @comment = Comment.new
    @comments = Comment.all
    if @current_user
       @leaders = @current_user.leaders
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      cookies[:user_id] = @user.id
      flash[:notice] = "Successfully Registered"
      redirect_to "/users/#{ @user.id }"
    else
      flash[:alert] = @user.errors.full_messages
      redirect_to "/users/new"
    end
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
    current_user
  end

  def show
    @user = User.find(params[:id])
    @post = Post.new
    current_user
    if @current_user
      @followerlink = Follower.where(leader_id: @user.id,
                                   follower_id: @current_user.id).first
    end
  end

  def contact
    @post = Post.new
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

  def privacy_policy
  end

  def staff
    @staff = User.all.where(staff_or_student: "staff")
    @user = @staff.order(:lname).reverse
  end

  def students
    @student = User.all.where(staff_or_student: "student")
    @user = @student.order(:lname).reverse
  end

  private

  def user_params
    params.require(:user).permit(:email,:password,:fname,:lname, :avatar, :staff_or_student)
  end
end
