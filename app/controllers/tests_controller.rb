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
    @answers =Answer.where(test_id: @test.id)
	end


  def check
    @test = Test.find(params[:test_id])
    @select_answers = Answer.find(params[:answer_ids])
    @flag = true
    @select_answers.each do |answer|
      if(answer.value !="True")
        @flag = false
      end
    end
    
    if @flag
      $bal = $bal + 1
    end
      if Test.where(id: @test.id+1).first
        $i = $i + 10
        redirect_to test_path(@test.id+1)
      else 
        redirect_to finaly_path
      end
    
  end


  def finaly
      @balu = $bal
      if not @balu==0
        @record = Result.create(user_id: current_user.id,score: @balu)
        @record.save
      else
        @record = Result.all.last
      end
      $bal=nil
  end


private

	def set_test
		@test = Test.find(params[:id])
	end

  def count
    @balu = 0
    @res=0
    @testes = Test.all
    @testes.each do |test|
        @res+=10

    end

  end



    def test_params
   		 params.require(:test).permit(:test_id, :title)
    end

end

