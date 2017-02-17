class TracksController < ApplicationController

  def new

  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy

  end

  def show

  end
  def track_params
    params.require(:track).permit(:name, :album_id)
  end
end
