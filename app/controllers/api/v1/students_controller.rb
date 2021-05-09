module Api
  module V1 
    class StudentsController < ActionController::API    
      # GET /students
      def index
        render json: Student.all
      end
    
      # GET /students/1
      def show
        render json: Student.find(params[:id])
      end
    
      # POST /students
      def create
        student = Student.new(student_params)
    
        if student.save
            render json: student
        end
      end
    
      # PATCH/PUT /students/1
      def update
        if @student.update(student_params)
          render json: @student
        else
          render json: @student.errors, status: :unprocessable_entity
        end
      end
    
      # DELETE /students/1
      def destroy
        @student.destroy
      end
    
      private    
        # Only allow a list of trusted parameters through.
        def student_params
          params.require(:student)
            .permit(:nome, :email, :status, :role_id)
        end
    end
  end
end

