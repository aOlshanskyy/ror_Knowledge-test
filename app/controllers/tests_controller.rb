class TestsController < ApplicationController
  before_action :authenticate_user!
 	before_action :set_test, only: [ :show]
  before_action :count, only: [:check, :finaly]
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
  @tests = Test.all
  
    @i=10
    @answers =Answer.where(test_id: @test.id)
    @i+=20
	end


  def check
    @test = Test.find(params[:test_id])
    @select_answers = Answer.find(params[:answer_ids])
    @flag = true
    @select_answers.each do |answer|
      if(answer.value !="True")
        @flag = false
        redirect_to root_path
      end
    end
    @count+=1
    if @flag
      if Test.where(id: @test.id+1).first
        @bal = @bal + 1
        redirect_to test_path(@test.id+1)
      else 
        redirect_to finaly_path
      end
    end
  end


  def finaly
  end


private

	def set_test
		@test = Test.find(params[:id])
	end

  def count
    @bal = 0
    @res=0
    @testes = Test.all
    @testes.each do |test|
        @res+=10

    end
    @count=0

  end



    def test_params
   		 params.require(:test).permit(:test_id, :title)
    end

end

