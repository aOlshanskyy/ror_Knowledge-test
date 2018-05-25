class TestsController < ApplicationController
 	before_action :set_test, only: [ :show]
	def new
  		@test = Test.new
    end

    def create
      if current_user.role == "Editor"  
       @test = Test.new(test_params)
        if @test.save
      	  redirect_to root_path
        else
      	  render 'pages/index'
        end
      end
    end

	def show
    @answers =Answer.where(test_id: @test.id)
	end

  def right
    @test = Test.find(params[:test_id])
    @select_answers = Answer.find(params[:answer_ids])
    @flag = true
    @select_answers.each do |answer|
      if(answer.value !="True")
        @flag = false
        redirect_to root_path
      end
    end
    if @flag
      if Test.where(id: @test.id+1).first
        redirect_to test_path(@test.id+1)
      else 
        redirect_to root_path
      end
    end
  end

private

	def set_test
		@test = Test.find(params[:id])
	end


    def test_params
   		 params.require(:test).permit(:test_id, :title)
    end

end

