class DiariesController < ApplicationController 
  def index
    @diary = Diary.all
  end
end
