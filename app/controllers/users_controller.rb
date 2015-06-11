class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.first_name = params[:first_name]
    @user.last_name = params[:last_name]
    @user.gender = params[:gender]
    @user.description = params[:description]
    @user.email = params[:email]
    @user.facebook = params[:facebook]
    @user.linkedin = params[:linkedin]
    @user.birth_date = params[:birth_date]
    @user.college = params[:college]
    @user.phone_number = params[:phone_number]

    if @user.save
      redirect_to "/users", :notice => "User created successfully."
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    @user.first_name = params[:first_name]
    @user.last_name = params[:last_name]
    @user.gender = params[:gender]
    @user.description = params[:description]
    @user.email = params[:email]
    @user.facebook = params[:facebook]
    @user.linkedin = params[:linkedin]
    @user.birth_date = params[:birth_date]
    @user.college = params[:college]
    @user.phone_number = params[:phone_number]

    if @user.save
      redirect_to "/users", :notice => "User updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])

    @user.destroy

    redirect_to "/users", :notice => "User deleted."
  end
end
