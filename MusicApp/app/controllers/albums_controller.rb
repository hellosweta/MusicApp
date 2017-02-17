class AlbumsController < ApplicationController
  def new
    @bands = Band.all
    @album = Album.new
    render :new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @album.errors.full_messages
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

  def show

  end

  private

  def album_params
    params.require(:album).permit(:name, :band_id)
  end
end
