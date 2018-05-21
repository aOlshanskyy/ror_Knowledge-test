class TestsController < ApplicationController
 	before_action :set_test, only: [ :show]
	def new
  		@test = Test.new
    end

    def create
       @test = Test.new(test_params)
        if @test.save
      	  redirect_to root_path
        else
      	  render 'pages/index'
        end
    end

	def show
	end

private

	def set_test
		@test = Test.find(params[:id])
	end


    def test_params
   		 params.require(:test).permit(:test_id, :title)
    end

end

