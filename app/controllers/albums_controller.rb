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
    @album = Album.find(params[:album_id])
  end

  private
  def album_params
    params.require(:album).permit(:name).merge(user_id: current_user.id)
  end
end
