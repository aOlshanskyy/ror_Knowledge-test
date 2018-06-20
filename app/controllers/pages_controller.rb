class PagesController < ApplicationController
  def index
  		@tests = Test.all
  		@answers = Answer.all
  		@gloder=0
  end

  def right
  end

end
