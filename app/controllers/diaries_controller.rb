class DiariesController < ApplicationController 
  def index
    @album = Album.find(params[:album_id])
    @diaries = @album.diaries.includes(:user)
  end

  def new
    @album = Album.find(params[:album_id])
    @diary = Diary.new
  end

  def create
    @lbum = Album.find(params[:album_id])
    @diary = Diary.new(diary_params)
    if @diary.save 
     
      redirect_to album_diaries_path
    else
      render :new
    end
  end

  private 
  
  def diary_params
    params.require(:diary).permit(:start_time, :weather_id, :image, :title,:content, :place).merge(user_id: current_user.id, album_id: params[:album_id] )
  end

end
