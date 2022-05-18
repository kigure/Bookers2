class UsersController < ApplicationController
  #users_path /users
  def index
  end
  #/users/:id
  def show
    @user = User.find(params[:id])
  end
  def  edit
    @user = User.find(params[:id])
  end
 
  
  
  
end
