module Api
  module V1
    class StudentsController < ActionController::API
      def index
        render json: Student.all
      end

      def show
        render json: Student.find(params[:id])
      end

      def create
        student = Student.new(student_params)

        if student.save
          render json: student
        end
      end

      def update
        student = Student.find(params[:id])
        if student.update(student_params)
          render json: student
        else
          render json: student.errors, status: :unprocessable_entity
        end
      end

      def destroy
        student = Student.find(params[:id])
        student.destroy
        render json: { status: "SUCCESS", message: "Deleted student", data: student }, status: :ok
      end

      private

      def student_params
        params.require(:student)
          .permit(:nome, :email, :status, :role_id)
      end
    end
  end
end
