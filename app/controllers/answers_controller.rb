class AnswersController < ApplicationController
before_action :set_answer, only: [ :show]
	def new
  		@answer = Answer.new
    end

    def create
      if current_user.role == "Editor"  
       @answer = Answer.new(answer_params)
        if @answer.save
      	  redirect_to root_path
        else
      	  render 'pages/index'
        end
      end
    end

	def show
	end


private

	def set_answer
		@answer = Answer.find(params[:id])
	end


    def answer_params
   		 params.require(:answer).permit(:test_id, :version, :value, :answer_id)
    end
end
