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
        if current_user.admin? && @user == current_user
          render json: @user
        else
          render json: @user.errors.full_messages
        end
      end

      def update
        if @user.update_attributes(secure_params)
          render json: @user
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      def edit
      end

      def destroy
        @user.destroy
        if @user.destroy
          head :no_content, status: :ok
        else
          render json: @user.errors, status: :unprocessable_entity
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
