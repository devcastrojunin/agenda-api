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
                    render error: {error: "Unable to create role"}, status: 400                    
                end
            end

            def update
               role = Role.update(role_params)
               render json: role
            end
            def update
                role = Role.update(role_params)
                if role
                  render json: role
                else
                  render json: role.errors, status: :unprocessable_entity
                end
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