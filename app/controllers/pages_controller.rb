class PagesController < ApplicationController
  def index
  		@tests = Test.all
  		@answers = Answer.all
  		@gloder=0
  		      @balu = $bal
      if not @balu==0
        @record = Result.create(user_id: current_user.id,score: @balu)
        @record.save
      else
        @record = Result.all.last
      end
      $bal=nil
  end

  def right
  end

end
