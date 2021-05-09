module Api
    module V1
        class UsersController < ActionController::API
            def index
                render json: User.all
            end

            def show
                render json: User.find(params[:id])
            end
            
            def create
                user = User.new(user_params)

                if user.save
                    render json: user
                end
            end
            
            private

            # Strong parameters
            def user_params
                params.require(:user)
                    .permit(:nome, :idade, :email, :cpf, :rg, :data_nascimento)
            end
            
            

        end
    end
end