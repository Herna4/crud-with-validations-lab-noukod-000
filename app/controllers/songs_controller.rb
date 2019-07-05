class SongsController < ApplicationController

  before_action :set_song, only:[:show, :edit, :update, :destroy]


  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    if @song.update(song_params(:title, :artist_name, :genre, :release_year, :released))
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params(:title, :artist_name, :genre, :release_year, :released))
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)

    if @song.valid?
      @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @song.assign_attributes(song_params)
    if @song.valid?
      @song.save
      redirect_to song_path(@song)
    else

      render new_song_path

      render :edit

    end
  end

  def destroy

    @song = Song.find(params[:id])

    redirect_to songs_path
  end

  private


  def song_params(*args)
    params.require(:song).permit(*args)
  end


  def set_song
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:title, :released, :release_year, :genre, :artist_name)
  end

end
