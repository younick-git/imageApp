class PictureboardController < ApplicationController
  def index
    @post = Post.new(album_id: params[:id])
    @album = Album.find(params[:id])
    @total_images = Post.where(album_id: @album.id)
  end
end
