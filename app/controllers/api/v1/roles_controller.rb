module Api
  module V1
    class RolesController < ActionController::API
      def index
        render json: Role.all
      end

      def show
        render json: Role.find(params[:id])
      end

      def create
        role = Role.new(role_params)
        if role.save
          render json: role
        else
          render error: { error: "Unable to create role" }, status: 400
        end
      end

      def update
        role = Role.find(params[:id])
        if role.update(role_params)
          render json: { status: "SUCCESS", message: "Updated role", data: role }, status: :ok
        else
          render json: role.errors, status: :unprocessable_entity
        end
      end

      def destroy
        role = Role.find(params[:id])
        role.destroy
        render json: { status: "SUCCESS", message: "Deleted role", data: role }, status: :ok
      end

      private

      # Strong parameters
      def role_params
        params.require(:role)
          .permit(:nome, :status)
      end
    end
  end
end
