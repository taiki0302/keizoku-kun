class UsersController < ApplicationController
 before_action :authenticate_user!

 def show
  @user = current_user
 end

 def edit
     @user = current_user
 end

	def update
    @user = current_user
    	if @user.update(user_params)
           flash[:success] = "登録情報を変更しました"
           redirect_to users_path
        else
           render :edit and return
        end
	end

private

def customer_params
  	params.require(:user).permit(:email, :name)
end
end
