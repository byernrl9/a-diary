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
    @album = Album.find(params[:album_id])
    @diary = Diary.new(diary_params)
    if @diary.save 
     
      redirect_to album_diaries_path
    else
      render :new
    end
  end

  def show
    @diary = Diary.find(params[:id])
  end

  def edit
    @diary = Diary.find(params[:id])
  end

  def update
    @album = Album.find(params[:album_id])
    @diary = Diary.find(params[:id])
    if @diary.update(diary_params)
      redirect_to  album_diaries_path(@album)
    else
      render :edit
    end
  end


  private 
  
  def diary_params
    params.require(:diary).permit(:start_time, :weather_id, :image, :title,:content, :place).merge(user_id: current_user.id, album_id: params[:album_id] )
  end

end
