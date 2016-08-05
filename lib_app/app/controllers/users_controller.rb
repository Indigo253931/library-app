class UsersController < ApplicationController
# grab the users
    before_action :logged_in?, only: [:show]

    def index
    @users = User.all
    render :index
  end

  def new
    # we need to make a new user to pass to the form later
    @user = User.new
    render :new
  end

  def create
    user_params = params.require(:user).permit(:first_name, :last_name, :email, :password)
    @user = User.create(user_params)
    login(@user)

    redirect_to "/users/#{@user.id}"
  end

  def show
    @user = User.find(params[:id])
    render :show
  end

  def edit
    user_id = params[:id]
    @user = User.find_by_id(user_:id)
    render :edit
  end

  def create
    user_params = params.require(:user).permit(:first_name, :last_name, :email, :password)
    @user=User.create(user_params)
    login(@user)
    redirect_to "/users/#{@user.id}"
  end

  def update
    user_id = params[:id]
    user = User.find_by_id(user_id)
      user_params = get_user_params
      user.update_attributes(user_params)
      redirect_to "/users/#{user.id}"
  end

  def destroy
    user_id = params [:id]
    user = User.find_by_id(user_id)
    user.destroy
    redirect_to "/users"

  end


  private

  def get_user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
  
end
