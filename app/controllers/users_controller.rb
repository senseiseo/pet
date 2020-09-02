class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def show 
  	@user = User.find(params[:id])
  end 

  def create
    @user = User.new(user_params)    # Не окончательная реализация!
    if @user.save
      # Обработать успешное сохранение.
    else
      render 'new'
    end
  end 




  private 

  def user_params 
  	params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end 

end
