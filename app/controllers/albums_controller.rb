class AlbumsController < ApplicationController
  def index
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to albums_path
    else
      render :new
    end
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id])
    if @album.update(album_params)
      redirect_to  album_diaries_path(@album)
    else
      render :edit_album_path
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    redirect_to albums_path
  end

  private
  def album_params
    params.require(:album).permit(:name).merge(user_id: current_user.id)
  end
end
