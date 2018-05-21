class PagesController < ApplicationController
  def index
  		@tests = Test.all
  		@answers = Answer.all
  end
end
