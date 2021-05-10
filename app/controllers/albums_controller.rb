class AlbumsController < ApplicationController
  def index
    @album = Album.new
    @albums = current_user.albums
    @total_albums = Album.all
  end

  def create
    @album = current_user.albums.new(album_params)
    if @album.save
      redirect_to "/pictureboard?id=#{@album.id}"
    else
      render json: { error: @album.errors.full_messages.join(',')}, :status => 400
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.albums.where(id: params[:album_id]).destroy!
  end

  def all
    data = []
    Album.all.map do |album|
      data << jsonize_post(album)
    end
    render json: data
  end

  def mine
    data = []
    current_user.albums.each do |album|
      data << jsonize_post(album)
    end
    render json: data
  end

private
  def album_params
    params.require(:album).permit(:name)
  end

  def jsonize_post(album)
    {
      id: album.id,
      name: album.name,
      created_at: album.created_at.strftime("%B %d, %Y")
    }
  end
end
