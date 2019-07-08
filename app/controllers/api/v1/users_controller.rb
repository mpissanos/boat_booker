module Api
  module V1
    class UsersController < BaseApiController
      
      before_action :authenticate_user!
      before_action :set_user, only: [:show, :update, :destroy, :edit]
      
      def index
        @users = User.all
        render json: @users
      end

      def show
        @user
        unless current_user.admin? && @user == current_user
            redirect_to root_path, :alert => "Access denied."
        end
      end

      def update
        if @user.update_attributes(secure_params)
          render json: @user
        else
          redirect_to users_path, :alert => "Unable to update user."
        end
      end

      def edit
      end

      def destroy
        @user.destroy
        redirect_to users_path, :notice => "User deleted."
      end

      private

      def secure_params
        params.require(:user).permit(:role)
      end

      def set_user
        @user = User.find(params[:id])
      end
    end
  end
end
