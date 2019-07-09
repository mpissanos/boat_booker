module Api
  module V1
    class UsersController < BaseApiController
      
    before_action :authorize_request, except: :create
    before_action :find_user, except: %i[create index]
      
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

      def find_user
        @user = User.find_by_username!(params[:_username])
        rescue ActiveRecord::RecordNotFound
          render json: { errors: 'User not found' }, status: :not_found
      end
    end
  end
end
