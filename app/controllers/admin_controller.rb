class AdminController < ApplicationController
    before_action :authenticate_user!  # Asegura que solo usuarios autenticados accedan
    before_action :authorize_admin

    def index
      @users = User.order(created_at: :desc).page(params[:page]).per(150)
    end

    def show
      @user = User.find(params[:id])
    end

    def edit
      @user = User.find(params[:id])  # Carga el usuario para editarlo
    end
  
    def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        redirect_to admin_path(@user), notice: "Usuario actualizado correctamente."
      else
        render :edit
      end
    end
  
    def destroy
      @user = User.find(params[:id])
      if @user.destroy
        redirect_to admin_path, notice: "Usuario eliminado correctamente."
      else
        redirect_to admin_path, alert: "No se pudo eliminar el usuario."
      end
    end
  
    private
  
    def user_params
      params.require(:user).permit(:email, :role, :password, :password_confirmation)  # Solo permite editar estos campos
    end
  
    def authorize_admin
      redirect_to root_path, alert: "No tienes permisos para realizar esta acción." unless current_user.admin?
    end
end
