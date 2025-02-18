class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :set_user, only: [:edit, :update, :destroy]
  
    def index
      @users = User.all
    end
  
    def edit
    end
  
    def update
      if @user.update(user_params)
        flash[:notice] = "User created successfully"
        redirect_to dashboard_path
      else
        flash.now[:alert] = @user.errors.full_messages.join(", ")
        render :edit, status: :unprocessable_entity
      end
    end
  
    def destroy
      @user.destroy
        flash[:notice] = "User deleted successfully"
        redirect_to dashboard_path
    end
  
    private
  
    def set_user
      @user = User.find(params[:id])
    end
  
    def user_params
      params.require(:user).permit(:email, :name, :cpf, :rg, :telephone, :photo, :role, :unit_id, :sector_id)
    end
  end