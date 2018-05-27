class PagesController < ApplicationController
  def index
  		@tests = Test.all
  		@answers = Answer.all
  end

  def right
  end

end
